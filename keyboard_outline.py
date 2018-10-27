from collections import defaultdict
from datetime import datetime
from multiprocessing import Pool
from openpyscad import Cube
from keyboard_state import Position, XYZVector

import numpy as np
import utils


def points_in_same_plane(point_a, point_b):
    same_x = np.isclose(point_a.translation.x_comp, point_b.translation.x_comp)
    same_y = np.isclose(point_a.translation.y_comp, point_b.translation.y_comp)
    return same_x or same_y


def get_middle_point(point_a, point_b, offset=[0, 0, 0]):
    rel_middle = (point_b - point_a) / 2
    rel_middle += offset
    return point_a + rel_middle


def generate_simple_solid_outline(keyboard_state):
    walls = []
    corner_shapes = []
    for key_mount in keyboard_state.border_mounts:
        corner_points = key_mount.fetch_outer_corners()
        for corner_point in corner_points:
            shape = Cube([.1, .1, keyboard_state.wall_thickness], center=True)
            shape = shape.rotate(corner_point.rotation.tolist())
            shape = shape.translate(corner_point.translation.tolist())
            if corner_shapes:
                walls.append((corner_shapes[-1] + shape).hull())
            corner_shapes.append(shape)
    walls.append((corner_shapes[0] + corner_shapes[-1]).hull())
    return utils.sum_shapes(walls).color([.4, .6, .5]), corner_shapes


def generate_outer_outline(keyboard_state, expand_distance):
    walls = []
    corner_shapes = []
    for key_mount in keyboard_state.border_mounts:
        key_mount.side_expand_distance = expand_distance
        corner_points = key_mount.fetch_outer_corners()
        for corner_point in corner_points:
            shape = Cube([.1, .1, keyboard_state.wall_thickness], center=True)
            shape = shape.rotate(corner_point.rotation.tolist())
            shape = shape.translate(corner_point.translation.tolist())
            if corner_shapes:
                walls.append((corner_shapes[-1] + shape).hull())
            corner_shapes.append(shape)
    walls.append((corner_shapes[0] + corner_shapes[-1]).hull())
    return utils.sum_shapes(walls).turn_on_debug(), corner_shapes


def euclidean_dist(point_a, point_b):
    return np.linalg.norm(point_a.translation - point_b.translation)


def equalize_trajectories(points_a, points_b):
    swap_ab = False
    if len(points_a) < len(points_b):
        swap_ab = True
        points_a, points_b = points_b, points_a
    a_to_b_map = {}
    min_match_a_idx = 9999999
    # Find the best alignment for points_b
    for idx_b, point_b in enumerate(points_b):
        distances_a = []
        for idx_a, point_a in enumerate(points_a):
            distances_a.append((idx_a, euclidean_dist(point_a, point_b)))
        min_a_idx = 0
        min_dist = distances_a[0][1]
        for (idx, dist) in distances_a:
            if dist < min_dist:
                min_dist = dist
                min_a_idx = idx
        min_match_a_idx = min(min_match_a_idx, min_a_idx)
        a_to_b_map[min_a_idx] = idx_b

    # Patch gaps in our points_b coverage
    expanded_b = []
    for idx_a in range(len(points_a)):
        if idx_a not in a_to_b_map:
            # Repeat the previous closest b match.
            idx_b = a_to_b_map[min_match_a_idx]
            expanded_b.append(points_b[idx_b])
        else:
            idx_b = a_to_b_map[idx_a]
            expanded_b.append(points_b[idx_b])
            min_match_a_idx = idx_a
    points_b = expanded_b
    if swap_ab:
        points_a, points_b = points_b, points_a
    return points_a, points_b


def join_outlines(shapes_a, shapes_b):
    assert len(shapes_a) == len(shapes_b)
    iter_a = iter(shapes_a + [shapes_a[0]])
    iter_b = iter(shapes_b + [shapes_b[0]])
    hulls = []
    shape_c = None
    shape_d = None
    print(f"Applying hull between {len(shapes_a)} shapes: ", end="")
    for progress, (shape_a, shape_b) in enumerate(zip(iter_a, iter_b)):
        if progress % 8 == 0:
            print(f"#{progress + 1}, ", end="")
        if shape_c and shape_d:
            hulls.append((shape_a + shape_b + shape_c).hull())
            hulls.append((shape_a + shape_b + shape_d).hull())
            hulls.append((shape_b + shape_c + shape_d).hull())
            hulls.append((shape_a + shape_c + shape_d).hull())
        shape_c = next(iter_a, shape_a)
        shape_d = next(iter_b, shape_b)
        hulls.append((shape_a + shape_b + shape_c).hull())
        hulls.append((shape_a + shape_b + shape_d).hull())
        hulls.append((shape_a + shape_c + shape_d).hull())
        hulls.append((shape_b + shape_c + shape_d).hull())

    print("\nReducing hulls into a single shape...")
    return utils.sum_shapes(hulls).color([.5, .8, .7])


def get_corner_normal(key_mount, offset):
    # Note, only works with corners
    if key_mount.is_up_left_corner:
        normal = [-offset, offset, 0]
    elif key_mount.is_up_right_corner:
        normal = [offset, offset, 0]
    elif key_mount.is_down_right_corner:
        normal = [offset, -offset, 0]
    elif key_mount.is_down_left_corner:
        normal = [-offset, -offset, 0]
    elif key_mount.is_top:
        normal = [0, offset, 0]
    elif key_mount.is_bottom:
        normal = [0, -offset, 0]
    else:
        # Mount is not at a border so return +z
        normal = [0, 0, offset]
    normal = utils.rotate(normal, key_mount.rotation)
    return normal


def normal_vector(pos_plane):
    """ Interprets `position` as a 2D plane and return its normal vector."""
    # Convert the point's rotation into a set of 3 points that form a tringle.
    point_1 = pos_plane.translation
    point_2 = utils.rotate([0, 10, 0], rotation=pos_plane.rotation)
    point_2 = utils.translate(point_2, pos_plane.translation)
    point_2 = np.array(point_2)
    point_3 = utils.rotate([10, 0, 0], rotation=pos_plane.rotation)
    point_3 = utils.translate(point_3, pos_plane.translation)
    point_3 = np.array(point_3)
    # Use the 3 points to define the plane with vectors A and B.
    A = point_2 - point_1
    B = point_3 - point_1
    normal_vec = np.cross(A, B)
    return normal_vec


def project(point, plane):
    """Projects point onto a plane and returns the resulting vector.
    Args:
        - point: A simple x y z vector
        - plane: A Position object with translation and rotation.
    """
    normal = normal_vector(pos_plane=plane)
    orthogonal_line = np.dot(normal, (point - plane.translation))
    intersecting_line = orthogonal_line / np.dot(normal, normal)
    return point - intersecting_line * normal


def out_outline(keyboard_state, outer_expand, curvature, height_expand, offset_to_corner, interpolation_segments=18, shrink_sides=False):
    INDEX_SIDE = 0
    INDEX = 1
    MIDDLE = 2
    RING = 3
    PINKY = 4
    TOP_ROW = 2
    CENTER_ROW = 1
    BOTTOM_ROW = 0
    vertical_dist = 48
    horizontal_dist = 80
    # Plane spawning from the center of the keyboard pointing towards the hand.
    plate_plane = Position(
        rotation=keyboard_state.center.rotation,
        translation=keyboard_state.center.translation + [0, 0, 20],
    )
    # Orthogonal to the plate. Normal from top to bottom of plate.
    # Move the plane towards the top of the plate.
    top_plane = Position(
        rotation=plate_plane.rotation + [90, 0, 0],
        translation=plate_plane.translation + [0, vertical_dist, 0],
    )
    bottom_plane = Position(
        rotation=plate_plane.rotation + [-90, 0, 0],
        translation=plate_plane.translation + [0, -vertical_dist + 10, 0],
    )
    left_plane = Position(
        # BUG: We should be able to just rotate the plane by 90 degrees but the
        # result is not quite right. The -3.5 compensation in X is a HACK.
        rotation=plate_plane.rotation + [-3.5, -90, 0],
        translation=plate_plane.translation + [-horizontal_dist, 0, 0],
    )
    right_plane = Position(
        rotation=plate_plane.rotation + [-3.5, -90, 0],
        translation=plate_plane.translation + [horizontal_dist + 60, 0, 0],
    )
    # new_boys = []

    # walls = []
    # corner_shapes = []
    outline_points = []
    for key_mount in keyboard_state.border_mounts:
        key_mount.points = []
        key_mount.side_expand_distance = outer_expand
        corner_points = key_mount.fetch_double_outer_sides(offset_to_corner=offset_to_corner)
        if key_mount.col_idx == PINKY:
            key_mount.points.extend(corner_points)
            continue
        if key_mount.col_idx == MIDDLE:
            key_mount.points.extend(corner_points)
            continue
        if key_mount.col_idx == RING:
            key_mount.points.extend(corner_points)
            continue
        if (key_mount.col_idx == PINKY or key_mount.col_idx == INDEX_SIDE) and key_mount.row_idx == CENTER_ROW:
            # We avoid visual glitches when joining with the outer outline by
            # making sure that this point is joined with multiple of the
            # outer segments.
            p0, p1 = corner_points
            bezier_offset = get_corner_normal(key_mount, offset=0)
            bezier_control = get_middle_point(
                point_a=p0,
                point_b=p1,
                offset=bezier_offset,
            )
            trajectory = utils.interpolate_cuadratic_bezier(
                point_a=p0,
                point_b=p1,
                control_point=bezier_control,
                segments=interpolation_segments//3
            )
            corner_points = [p0] + trajectory + [p1]
        if key_mount.row_idx == TOP_ROW:
            if key_mount.is_corner:
                points_to_shift = corner_points[:2]
            else:
                points_to_shift = corner_points
            for idx, point in enumerate(points_to_shift):
                plane_projection = project(point.translation, plate_plane)
                projection = project(plane_projection, top_plane)
                new_boy = Position(
                    rotation=point.rotation,
                    translation=projection
                )
                # new_boys.append(new_boy)
                points_to_shift[idx] = new_boy
        elif key_mount.row_idx == BOTTOM_ROW:
            if key_mount.is_down_right_corner:
                points_to_shift = corner_points[:2]
            elif key_mount.is_down_left_corner:
                points_to_shift = corner_points[2:]
            else:
                points_to_shift = corner_points
            for idx, point in enumerate(points_to_shift):
                plane_projection = project(point.translation, plate_plane)
                projection = project(plane_projection, bottom_plane)
                new_boy = Position(
                    rotation=point.rotation,
                    translation=projection
                )
                # new_boys.append(new_boy)
                points_to_shift[idx] = new_boy
        if key_mount.col_idx == INDEX_SIDE:
            if key_mount.row_idx == TOP_ROW:
                points_to_shift = corner_points[2:]
            elif key_mount.row_idx == BOTTOM_ROW:
                points_to_shift = corner_points[:2]
            else:
                points_to_shift = corner_points
            for idx, point in enumerate(points_to_shift):
                # plane_projection = project(point.translation, plate_plane)
                projection = project(point.translation, left_plane)
                new_boy = Position(
                    rotation=point.rotation,
                    translation=projection
                )
                # new_boys.append(new_boy)
                points_to_shift[idx] = new_boy
        elif key_mount.col_idx == PINKY:
            if key_mount.row_idx == TOP_ROW:
                points_to_shift = corner_points[:2]
            elif key_mount.row_idx == BOTTOM_ROW:
                points_to_shift = corner_points[2:]
            else:
                points_to_shift = corner_points
            for idx, point in enumerate(points_to_shift):
                # plane_projection = project(point.translation, plate_plane)
                projection = project(point.translation, right_plane)
                new_boy = Position(
                    rotation=point.rotation,
                    translation=projection
                )
                # new_boys.append(new_boy)
                points_to_shift[idx] = new_boy

        if key_mount.col_idx == INDEX and key_mount.row_idx == TOP_ROW:
            index = keyboard_state.mount(TOP_ROW, INDEX)
            middle = keyboard_state.mount(TOP_ROW, MIDDLE)
            ring = keyboard_state.mount(TOP_ROW, RING)
            pinky = keyboard_state.mount(TOP_ROW, PINKY)

            middle.side_expand_distance = outer_expand - 1
            ring.side_expand_distance = outer_expand - 3
            pinky.side_expand_distance = outer_expand - 3  # This comes from the side shrinkage

            p0_in, p1_in = index.fetch_double_outer_sides(offset_to_corner=offset_to_corner)
            plane_projection = project(p0_in.translation, plate_plane)
            p0_in_projection = project(plane_projection, top_plane)
            p0_in = Position(rotation=p0_in.rotation, translation=p0_in_projection)
            plane_projection = project(p1_in.translation, plate_plane)
            p1_in_projection = project(plane_projection, top_plane)
            p1_in = Position(rotation=p1_in.rotation, translation=p1_in_projection)
            trajectory_index = utils.interpolate_linear(
                point_a=p0_in,
                point_b=p1_in,
                segments=interpolation_segments//3)
            index.points = [p0_in, p1_in]

            p0, p1 = middle.fetch_double_outer_sides(offset_to_corner=offset_to_corner)
            plane_projection = project(p0.translation, plate_plane)
            p0_projection = project(plane_projection, top_plane)
            p0 = Position(rotation=p0.rotation, translation=p0_projection)
            plane_projection = project(p1.translation, plate_plane)
            p1_projection = project(plane_projection, top_plane)
            p1 = Position(rotation=p1.rotation, translation=p1_projection)
            trajectory_middle = utils.interpolate_linear(
                point_a=p0,
                point_b=p1,
                segments=interpolation_segments//3)
            middle.points = [p0, p1]
            _, p4, p3, _ = pinky.fetch_double_outer_sides(offset_to_corner=offset_to_corner)
            p5, _, _, p2 = pinky.fetch_double_outer_sides(offset_to_corner=0)
            p5_projection = project(p5.translation, right_plane)
            p5 = Position(rotation=p5.rotation, translation=p5_projection)
            # p5, p4, p3, p2 = pinky.fetch_double_outer_sides(offset_to_corner=offset_to_corner)
            # bezier_offset = get_corner_normal(middle, offset=curvature)
            bezier_offset = utils.rotate([30, 22, 0], middle.rotation)
            bezier_control = get_middle_point(
                point_a=p5,
                point_b=p1,
                offset=bezier_offset,
            )
            trajectory = utils.interpolate_cuadratic_bezier(
                point_a=p5,
                point_b=p1,
                control_point=bezier_control,
                segments=int(interpolation_segments * 2.4) # All outlines must have same amount of segments
            )
            # We avoid visual glitches when joining with the outer outline by
            # making sure that this point is joined with multiple of the
            # outer segments.
            p6, p7 = keyboard_state.mount(CENTER_ROW, PINKY).fetch_double_outer_sides(offset_to_corner=0)
            p6_projection = project(p6.translation, right_plane)
            p6 = Position(rotation=p6.rotation, translation=p6_projection)
            p7_projection = project(p7.translation, right_plane)
            p7 = Position(rotation=p7.rotation, translation=p7_projection)
            bezier_offset = get_corner_normal(key_mount, offset=0)
            bezier_control = get_middle_point(
                point_a=p6,
                point_b=p7,
                offset=bezier_offset,
            )
            trajectory_side = utils.interpolate_cuadratic_bezier(
                point_a=p6,
                point_b=p7,
                control_point=bezier_control,
                segments=interpolation_segments//2
            )
            side_points = [p6] + trajectory_side + [p7]
            corner_points = side_points + [p5] + trajectory + trajectory_index
            ring.points = corner_points
            key_mount.points = corner_points

        elif key_mount.col_idx == INDEX and key_mount.row_idx == BOTTOM_ROW:
            index = keyboard_state.mount(BOTTOM_ROW, INDEX)
            ring = keyboard_state.mount(BOTTOM_ROW, RING)
            pinky = keyboard_state.mount(BOTTOM_ROW, PINKY)

            index.side_expand_distance = outer_expand - 1
            ring.side_expand_distance = outer_expand - 3
            pinky.side_expand_distance = outer_expand - 3  # This comes from the side shrinkage

            p1, p0 = index.fetch_double_outer_sides(offset_to_corner=offset_to_corner)
            plane_projection = project(p0.translation, plate_plane)
            p0_projection = project(plane_projection, bottom_plane)
            p0 = Position(rotation=p0.rotation, translation=p0_projection)
            plane_projection = project(p1.translation, plate_plane)
            p1_projection = project(plane_projection, bottom_plane)
            p1 = Position(rotation=p1.rotation, translation=p1_projection)

            p0 = Position(rotation=p0.rotation, translation=p0_projection)
            plane_projection = project(p1.translation, plate_plane)
            p1_projection = project(plane_projection, bottom_plane)
            p1 = Position(rotation=p1.rotation, translation=p1_projection)
            trajectory_index = utils.interpolate_linear(
                point_a=p0,
                point_b=p1,
                segments=interpolation_segments//3)
            # index.points = [p1, p0]

            # index.points = [p0_in, p1_in]

            # index.points = [p0, p1]
            _, p3, p4, _ = pinky.fetch_double_outer_sides(offset_to_corner=offset_to_corner)
            p2, _, _, p5 = pinky.fetch_double_outer_sides(offset_to_corner=0)
            p5_projection = project(p5.translation, right_plane)
            p5 = Position(rotation=p5.rotation, translation=p5_projection)
            # p5, p4, p3, p2 = pinky.fetch_double_outer_sides(offset_to_corner=offset_to_corner)
            # bezier_offset = get_corner_normal(index, offset=curvature)
            bezier_offset_1 = utils.rotate([5, -5, 0], index.rotation)
            bezier_offset_2 = utils.rotate([36, -38, -10], index.rotation)
            bezier_1 = get_middle_point(
                point_a=p0,
                point_b=p5,
                offset=bezier_offset_1,
            )
            bezier_2 = get_middle_point(
                point_a=p0,
                point_b=p5,
                offset=bezier_offset_2,
            )
            trajectory = utils.interpolate_cubic_bezier(
                start=p0.translation,
                end=p5.translation,
                bezier_1=bezier_1.translation,
                bezier_2=bezier_2.translation,
                segments=int(interpolation_segments * 2.4) # All outlines must have same amount of segments
            )
            trajectory = [Position(rotation=index.rotation, translation=p) for p in trajectory]
            # p5 has a different rotation so we exclude it
            corner_points = [p1] + trajectory_index[::-1] + [p0] + trajectory
            key_mount.points = corner_points
            ring.points = corner_points

        elif len(corner_points) == 4:
            _, p1, p2, _ = corner_points
            p0, _, _, p3 = key_mount.fetch_double_outer_sides(offset_to_corner=0)
            if key_mount.col_idx == INDEX_SIDE and (key_mount.row_idx == TOP_ROW):
                key_mount.side_expand_distance = outer_expand + 1.6
                p0, _, _, _ = key_mount.fetch_double_outer_sides(offset_to_corner=0)
                _, p1, _, _ = key_mount.fetch_double_outer_sides(offset_to_corner=offset_to_corner)
                # p0 is top index_side with middle transition
                plane_projection = project(p0.translation, plate_plane)
                p0_projection = project(plane_projection, top_plane)
                p0 = Position(rotation=keyboard_state.mount(TOP_ROW, MIDDLE).rotation, translation=p0_projection)
                # p1 is the start of the corner on the top side
                plane_projection = project(p1.translation, plate_plane)
                p1_projection = project(plane_projection, top_plane)
                p1 = Position(rotation=keyboard_state.mount(TOP_ROW, MIDDLE).rotation, translation=p1_projection)

                p2_projection = project(p2.translation, left_plane)
                p2 = Position(rotation=p2.rotation, translation=p2_projection)
                p3_projection = project(p3.translation, left_plane)
                p3 = Position(rotation=p3.rotation, translation=p3_projection)
                bezier_offset = get_corner_normal(key_mount, offset=curvature+1)
            elif key_mount.col_idx == INDEX_SIDE and (key_mount.row_idx == BOTTOM_ROW):
                # p2 is bottom index_side start of corner
                plane_projection = project(p2.translation, plate_plane)
                p2_projection = project(plane_projection, bottom_plane)
                p2 = Position(rotation=keyboard_state.mount(BOTTOM_ROW, MIDDLE).rotation, translation=p2_projection)
                # p3 is bottom index side with index transition
                plane_projection = project(p3.translation, plate_plane)
                p3_projection = project(plane_projection, bottom_plane)
                p3 = Position(rotation=keyboard_state.mount(BOTTOM_ROW, MIDDLE).rotation, translation=p3_projection)

                p0_projection = project(p0.translation, left_plane)
                p0 = Position(rotation=p0.rotation, translation=p0_projection)
                p1_projection = project(p1.translation, left_plane)
                p1 = Position(rotation=p1.rotation, translation=p1_projection)
                bezier_offset = get_corner_normal(key_mount, offset=curvature+1)
            # elif key_mount.col_idx == PINKY and (key_mount.row_idx == TOP_ROW):
            else:
                bezier_offset = get_corner_normal(key_mount, offset=curvature)

            bezier_control = get_middle_point(
                point_a=p1,
                point_b=p2,
                offset=bezier_offset,
            )
            trajectory = utils.interpolate_cuadratic_bezier(
                point_a=p1,
                point_b=p2,
                control_point=bezier_control,
                segments=interpolation_segments
            )
            trajectory_gap_1 = utils.interpolate_linear(
                point_a=p0,
                point_b=p1,
                segments=interpolation_segments//3)
            trajectory_gap_2 = utils.interpolate_linear(
                point_a=p2,
                point_b=p3,
                segments=interpolation_segments//3)
            corner_points = [p0] + trajectory_gap_1 + trajectory + trajectory_gap_2 + [p3]
            key_mount.points.extend(corner_points)
        else:
            key_mount.points.extend(corner_points)
        outline_points.extend(corner_points)
    #     for corner_point in corner_points:
    #         shape = Cube([.1, .1, keyboard_state.wall_thickness], center=True)
    #         shape = shape + shape.translate([0, 0, height_expand])
    #         shape = shape.rotate(corner_point.rotation.tolist())
    #         shape = shape.translate(corner_point.translation.tolist())
    #         if corner_shapes:
    #             walls.append((corner_shapes[-1] + shape).hull())
    #         corner_shapes.append(shape)
    # walls.append((corner_shapes[0] + corner_shapes[-1]).hull())
    # reference_plane = Cube([90, 110, .01], center=True)
    # reference_plane = reference_plane.color([.8, .9, .89])
    # reference_plane = reference_plane.transparent()
    # reference_plane = reference_plane.rotate(plate_plane.rotation.tolist())
    # reference_plane = reference_plane.translate(plate_plane.translation.tolist())
    # new_cube = Cube(4, center=True).color([.3, .9, .89])
    # new_cube = new_cube.rotate(plate_plane.rotation.tolist())
    # new_cube = new_cube.translate(plate_plane.translation.tolist())
    # reference_plane += new_cube

    # plane_2 = Cube([175, 100, .01], center=True)
    # plane_2 = plane_2.color([.82, .7, .72])
    # plane_2 = plane_2.turn_on_transparent()
    # plane_2 = plane_2.rotate(right_plane.rotation.tolist())
    # plane_2 = plane_2.translate(right_plane.translation.tolist())
    # reference_plane += plane_2
    # new_cube = Cube(4, center=True).color([.3, .9, .89])
    # new_cube = new_cube.translate(right_plane.translation.tolist())
    # reference_plane += new_cube

    # for new_boy in new_boys:
    #     new_cube = Cube(2, center=True)
    #     new_cube = new_cube.color([.78, .7, .59])
    #     new_cube = new_cube.rotate(new_boy.rotation.tolist())
    #     new_cube = new_cube.translate(new_boy.translation.tolist())
    #     reference_plane += new_cube
    return outline_points
    # return utils.sum_shapes(walls).color([.6, .7, .2]), corner_shapes


def generate_outer_curve_outline(keyboard_state, outer_expand, curvature, height_expand, offset_to_corner, interpolation_segments=18, shrink_sides=False):
    walls = []
    corner_shapes = []
    INDEX_SIDE = 0
    INDEX = 1
    MIDDLE = 2
    RING = 3
    PINKY = 4
    TOP_ROW = 2
    BOTTOM_ROW = 0
    CENTER_ROW = 1

    outline_points = []
    for key_mount in keyboard_state.border_mounts:
        key_mount.points = []
        key_mount.side_expand_distance = outer_expand
        corner_points = key_mount.fetch_double_outer_sides(offset_to_corner=offset_to_corner)
        if key_mount.col_idx == RING or key_mount.col_idx == MIDDLE or key_mount.col_idx == INDEX or ((key_mount.col_idx == PINKY or key_mount.col_idx == INDEX_SIDE) and key_mount.row_idx == CENTER_ROW):
            # We avoid visual glitches when joining with the outer outline by
            # making sure that this point is joined with multiple of the
            # outer segments.
            p0, p1 = corner_points
            bezier_offset = get_corner_normal(key_mount, offset=0)
            bezier_control = get_middle_point(
                point_a=p0,
                point_b=p1,
                offset=bezier_offset,
            )
            trajectory = utils.interpolate_cuadratic_bezier(
                point_a=p0,
                point_b=p1,
                control_point=bezier_control,
                segments=interpolation_segments//3
            )
            corner_points = [p0] + trajectory + [p1]

        if (key_mount.col_idx == INDEX_SIDE or key_mount.col_idx == PINKY) and (key_mount.row_idx == TOP_ROW or key_mount.row_idx == BOTTOM_ROW):
            # We avoid visual glitches when joining with the outer outline by
            # making sure that this point is joined with multiple of the
            # outer segments.
            _, p1, p2, _ = corner_points
            p0, _, _, p3 = key_mount.fetch_double_outer_sides(offset_to_corner=0)
            bezier_offset = get_corner_normal(key_mount, offset=0)
            bezier_control = get_middle_point(
                point_a=p2,
                point_b=p3,
                offset=bezier_offset,
            )
            trajectory_top = utils.interpolate_cuadratic_bezier(
                point_a=p2,
                point_b=p3,
                control_point=bezier_control,
                segments=interpolation_segments//3
            )
            bezier_control = get_middle_point(
                point_a=p0,
                point_b=p1,
                offset=bezier_offset,
            )
            trajectory_bottom = utils.interpolate_cuadratic_bezier(
                point_a=p0,
                point_b=p1,
                control_point=bezier_control,
                segments=interpolation_segments//3
            )
            bezier_offset = get_corner_normal(key_mount, offset=curvature)
            bezier_control = get_middle_point(
                point_a=p1,
                point_b=p2,
                offset=bezier_offset,
            )
            trajectory_corner = utils.interpolate_cuadratic_bezier(
                point_a=p1,
                point_b=p2,
                control_point=bezier_control,
                segments=interpolation_segments//3
            )
            corner_points = []
            corner_points.extend([p0])
            corner_points.extend(trajectory_bottom)
            corner_points.extend([p1])
            corner_points.extend(trajectory_corner)
            corner_points.extend([p2])
            corner_points.extend(trajectory_top)
            corner_points.extend([p3])

        if len(corner_points) == 4:
            # 4 points (p0, p1, p2, p3) means this key is at the corner of the
            # plate:
            #
            #    .---p2----p3---.
            #    |              |
            #    p1             |
            #    |              |
            #    |              |
            #    p0             |
            #    |              |
            #    .--------------.
            #
            # Ideally p1 and p2 should have a corner offset, while p0 and p3
            # should not. This is because of artifacts when joining curved and
            # straight outlines.
            # In other words, p0 and p3 should have offset_to_corner=0 for
            # the outline to look nice like this:
            #
            #    .---p2--------p3
            #    |              |
            #    p1             |
            #    |              |
            #    |              |
            #    |              |
            #    |              |
            #    p0-------------.
            #
            # But fetch_double_outer_sides is dumb and applies the
            # offset to all points, so we're hackily calling it a second time.
            _, p1, p2, _ = corner_points
            p0, _, _, p3 = key_mount.fetch_double_outer_sides(offset_to_corner=0)
            bezier_offset = get_corner_normal(key_mount, offset=curvature)
            bezier_control = get_middle_point(
                point_a=p1,
                point_b=p2,
                offset=bezier_offset,
            )
            trajectory = utils.interpolate_cuadratic_bezier(
                point_a=p1,
                point_b=p2,
                control_point=bezier_control,
                segments=interpolation_segments
            )
            corner_points = [p0] + trajectory + [p3]
        outline_points.extend(corner_points)
        key_mount.points.extend(corner_points)
    #     for corner_point in corner_points:
    #         shape = Cube([.1, .1, keyboard_state.wall_thickness], center=True)
    #         shape = shape + shape.translate([0, 0, height_expand])
    #         shape = shape.rotate(corner_point.rotation.tolist())
    #         shape = shape.translate(corner_point.translation.tolist())
    #         if corner_shapes:
    #             walls.append((corner_shapes[-1] + shape).hull())
    #         corner_shapes.append(shape)
    # walls.append((corner_shapes[0] + corner_shapes[-1]).hull())
    return outline_points
    # return utils.sum_shapes(walls).color([.6, .7, .2]), corner_shapes


def draw_shapes(points, base_height=3, extra_height=0):
    shapes = []
    for point in points:
        shape = Cube([.1, .1, base_height], center=True)
        shape = shape + shape.translate([0, 0, extra_height])
        shape = shape.rotate(point.rotation.tolist())
        shape = shape.translate(point.translation.tolist())
        shapes.append(shape)
    return shapes


def draw_outline(shapes):
    outline = [shapes[0]]
    for idx, shape in enumerate(shapes):
        outline.append((shapes[idx - 1] + shape).hull())
    return outline


def generate_plate_outline(keyboard_state, draft_version):
    if draft_version:
        interpolation_segments = 28
    else:
        interpolation_segments = 42
    start_time = datetime.now()
    print(f"==== Generating outline with {interpolation_segments} segments ====")
    print("Generating inner outline points...")
    inner_points = generate_outer_curve_outline(
        keyboard_state,
        outer_expand=0,
        curvature=0,
        height_expand=0,
        offset_to_corner=0,
        interpolation_segments=interpolation_segments,
    )
    print("Generating outer outline points...", end=" ")
    outer_points = out_outline(
        keyboard_state,
        outer_expand=6,
        curvature=4,
        height_expand=3,
        offset_to_corner=2,
        interpolation_segments=interpolation_segments,
        shrink_sides=True,
    )
    print(f"out: {len(outer_points)}  vs  in: {len(inner_points)}")
    if len(outer_points) != len(inner_points):
        outer_points, inner_points = equalize_trajectories(
            outer_points,
            inner_points,
        )

    inner_shapes = draw_shapes(points=inner_points)
    inner_shapes_up = draw_shapes(points=inner_points, base_height=3,
                                  extra_height=3)
    outer_shapes = draw_shapes(points=outer_points, base_height=3,
                               extra_height=3)

    outer_outline = draw_outline(shapes=outer_shapes)

    skeleton_outlines = [
        # thin_outline,
        # thin_outline_up.color([.7, .3, .5]),
        outer_outline,
    ]
    end_time = datetime.now()
    print(f"Finished generating outlines in {end_time - start_time}")
    if draft_version:
        return utils.sum_shapes(skeleton_outlines)
        return utils.sum_shapes(outer_shapes) + utils.sum_shapes(inner_shapes_up)

    match_msg = f"o: {len(outer_shapes)}  vs  i: {len(inner_shapes_up)}"
    assert len(outer_shapes) == len(inner_shapes_up), match_msg

    print("\nJoining outlines with hulls...")
    outer_hull = []
    with Pool(4) as pool:
        print("Joining inner_shapes with inner_shapes_up...")
        join_path = [
            (inner_shapes, inner_shapes_up),
            (inner_shapes_up, outer_shapes),
        ]
        outer_hull = pool.starmap(join_outlines, join_path)
    end_time = datetime.now()
    print(f"Finished joining outlines in {end_time - start_time}")
    return utils.sum_shapes(outer_hull)


def generate_thumb_outer_curve_outline(thumb_state, interpolation_segments=18):
    corner_shapes = []
    center_points = []
    mount_rotations = {
        0: [-10, 28, 12],
        1: [0, -5, 10.5],
        2: [6, -52, 9],
        3: [-36, -101, -41],
        4: [-7, -142, -12],
    }
    for idx, mount in enumerate(thumb_state.mount_matrix[0]):
        # Discard the mount's rotation and only use its translation.
        transform = utils.translate_mat(np.identity(4), mount.translation)
        rotation = mount_rotations[idx]
        transform = utils.rotate_mat(transform, rotation)
        center_points.append(
            Position(rotation=[0, 0, 0],
                     translation=[0, 0, 0],
                     rot_mat=transform)
        )

    # for point in center_points:
    #     shape = Cube([.1, .1, thumb_state.wall_thickness], center=True)
    #     shape = shape.translate([0, -9.5, 0])
    #     shape = shape.multmatrix(m=point.rot_mat.tolist())
    #     corner_shapes.append(shape)
    def make_arc(start, end, idx, rev=False):
        if idx == 3:
            bezier_offset_1 = utils.rotate([4, 16, 0], mount_rotations[idx])
            bezier_offset_2 = utils.rotate([-4, 16, 0], mount_rotations[idx])

        else:
            bezier_offset_1 = utils.rotate([0, 13, -16], mount_rotations[idx])
            bezier_offset_2 = utils.rotate([0, -13, -16], mount_rotations[idx])
            if rev:
                bezier_offset_1 *= np.array([1, -1, 1])
                bezier_offset_2 *= np.array([1, -1, 1])

        bezier_1 = get_middle_point(
            point_a=start,
            point_b=end,
            offset=bezier_offset_1,
        )
        bezier_2 = get_middle_point(
            point_a=start,
            point_b=end,
            offset=bezier_offset_2,
        )
        trajectory = utils.interpolate_cubic_bezier(
            start=start,
            end=end,
            bezier_1=bezier_1,
            bezier_2=bezier_2,
            segments=interpolation_segments
        )

        return trajectory, trajectory[len(trajectory)//2]

    # back_left_corner = (center_points[0].rot_mat @ [-8.5, -8.8, -.5, 1])[:3]
    # back_right_corner = (center_points[4].rot_mat @ [8.5, -8.8, -.5, 1])[:3]
    arcs = []
    middles = []
    exp = 1.4
    for idx in range(thumb_state.num_columns):
        top_right_corner = (center_points[idx].rot_mat @ [9+exp, -8.75-exp, -1.5, 1])[:3]
        top_left_corner = (center_points[idx].rot_mat @ [9.21+exp, 8.55+exp, -1.5, 1])[:3]
        bottom_right_corner = (center_points[idx].rot_mat @ [-9-exp, -8.55-exp, -1.5, 1])[:3]
        bottom_left_corner = (center_points[idx].rot_mat @ [-9-.21-exp, 8.55+exp, -1.5, 1])[:3]

        arc, middle = make_arc(top_left_corner, bottom_right_corner, idx)
        arcs.append(arc)
        middles.append(middle)
        arc, middle = make_arc(top_right_corner, bottom_left_corner, idx, rev=True)
        arcs.append(arc)
        middles.append(middle)

    final_shapes = []
    for arc_1, arc_2 in zip(arcs[0::2], arcs[1::2]):
        stripes = []
        for point_a, point_b in zip(arc_1, arc_2):
            shape_a = Cube([2, 2, 2], center=True)
            shape_a = shape_a.translate(point_a)
            shape_b = Cube([2, 2, 2], center=True)
            shape_b = shape_b.translate(point_b)
            # stripes.append((shape_a + shape_b).hull())
            stripes.append((shape_a + shape_b))
        prev_stripe = stripes[0]
        for stripe in stripes[1:]:
            # final_shapes.append((prev_stripe + stripe).hull())
            final_shapes.append((prev_stripe + stripe))
            prev_stripe = stripe

    # for arc_1, arc_2 in zip(arcs[0::2], arcs[2::2]):
    #     stripes = []
    #     for point_a, point_b in zip(arc_1[:len(arc_1)//2], arc_2[:len(arc_2)//2:-1]):
    #         shape_a = Cube([2, 2, 2], center=True)
    #         shape_a = shape_a.translate(point_a)
    #         shape_b = Cube([2, 2, 2], center=True)
    #         shape_b = shape_b.translate(point_b)
    #         stripes.append((shape_a + shape_b).hull())
    #     prev_stripe = stripes[0]
    #     for stripe in stripes[1:]:
    #         final_shapes.append((prev_stripe + stripe).hull())
    #         prev_stripe = stripe

    origin_plane = Position(rotation=[0, 0, 0], translation=[0, 0, 0])
    for arc in arcs[1:6:2]:
        stripes = []
        for point_a in arc[:-(interpolation_segments//5)]:
            shape_a = Cube([2, 2, 2], center=True)
            shape_a = shape_a.translate(point_a)

            point_b = project(point_a, origin_plane)
            # print(point_b, "hdsatnu")
            shape_b = Cube([2, 2, 2], center=True)
            # mat_b = utils.translate_mat(np.identity(4), point_b.tolist())
            # mat_b = utils.rotate_mat(mat_b, [90, 0, 90])

            cutter = Cube([505, 505, 100], center=True).translate([0, 0, -50])
            shape_b = shape_b.translate(point_a)
            shape_b = shape_b.translate([0, 0, -100])
            # shape_b = shape_b.multmatrix(mat_b.tolist())

            stripes.append((shape_a + shape_b).hull() - cutter)
        prev_stripe = stripes[0]
        for stripe in stripes[1:]:
            final_shapes.append((prev_stripe + stripe).hull())
            prev_stripe = stripe

    top_right_corner = (center_points[idx].rot_mat @ [9, -9.05, -1.5, 1])[:3]
    top_left_corner = (center_points[idx].rot_mat @ [9.21, 8.85, -1.5, 1])[:3]
    bottom_right_corner = (center_points[idx].rot_mat @ [-9, -9.05, -1.5, 1])[:3]
    bottom_left_corner = (center_points[idx].rot_mat @ [-9.21, 8.85, -1.5, 1])[:3]

    top_right_corner = (center_points[2].rot_mat @ [9, -9.05, -1.5, 1])[:3]
    bottom_right_corner = (center_points[2].rot_mat @ [-9, -9.05, -1.5, 1])[:3]

    # Bridge to main plate
    top_left_corner = (center_points[3].rot_mat @ [9.21, 8.85, -1.5, 1])[:3]
    bottom_left_corner = (center_points[3].rot_mat @ [-9.21, 8.85, -1.5, 1])[:3]

    cube_1 = Cube([2, .2, 3], center=True).translate(top_left_corner.tolist())
    cube_1 = cube_1.translate([-1.5, 0, -1.5])
    cube_2 = Cube([2, .5, 3], center=True).translate(bottom_left_corner.tolist())
    cube_2 = cube_2.translate([-1.7, 0, 1])
    cube_3 = cube_1.translate([4, 7, 0])
    cube_4 = cube_2.translate([12, 4, 0])
    # cube_3 = Cube([.5, .5, .5], center=True).translate(bottom_right_corner.tolist())
    # cube_4 = Cube([.5, .5, .5], center=True).translate(bottom_right_ground.tolist())
    final_shapes.append((cube_1 + cube_2 + cube_3 + cube_4).hull())

    shapes = utils.sum_shapes(final_shapes)
    return shapes.color([.7, .3, .5])


def generate_thumb_outer_curve_outline2(thumb_state, interpolation_segments=18):
    mount_centers = []
    mount_rotations = {
        0: [18.66, .3584, 16],
        1: [-5.9305, .3569, -3.3],
        2: [.0014, -.004, 0],
        3: [-32.8275, -1.494, 35.678],
        4: [25.237, -.168, -25],
    }
    for idx, mount in enumerate(thumb_state.mount_matrix[0]):
        # Discard the mount's rotation and only use its translation.
        transform = utils.translate_mat(np.identity(4), mount.translation)
        rotation = np.array(mount_rotations[idx]) + mount.rotation
        transform = utils.rotate_mat(transform, rotation)
        mount_centers.append(
            Position(rotation=rotation,
                     translation=mount.translation)
        )

    def place_cube(mount, offset, height=3):
        shape = Cube([.1, .1, height], center=True)
        shape = shape.translate(offset)
        shape = shape.rotate(mount.rotation.tolist())
        shape = shape.translate(mount.translation.tolist())
        return shape

    def interpolate_curve(mount, start, end, curvature):
        bezier_control = get_middle_point(
            point_a=start,
            point_b=end,
            offset=curvature,
        )
        trajectory = utils.interpolate_cuadratic_bezier(
            point_a=start,
            point_b=end,
            control_point=bezier_control,
            segments=interpolation_segments
        )
        trajectory.append(end)
        return trajectory

    def place_curve(mount, start, end, curvature, height=3):
        trajectory = interpolate_curve(mount, start, end, curvature)
        curve_shapes = []
        for point in trajectory:
            shape = Cube([.1, .1, height], center=True)
            shape = shape.translate(point.tolist())
            shape = shape.rotate(mount.rotation.tolist())
            shape = shape.translate(mount.translation.tolist())
            curve_shapes.append(shape)
        return curve_shapes

    mount_0 = mount_centers[0]
    mount_1 = mount_centers[1]
    mount_2 = mount_centers[2]
    mount_3 = mount_centers[3]
    mount_4 = mount_centers[4]

    outline_shapes = []
    # Distance to corner in both the x or y axis
    y_corner = 9.13
    x_corner = 9.41
    # Flat inner outline
    # ============= Bottom outline =============
    bl_0 = place_cube(mount_0, offset=[-x_corner, -y_corner, 0])
    br_0 = place_cube(mount_0, offset=[x_corner, -y_corner, 0])
    bottom_0_in = (bl_0 + br_0).hull()
    outline_shapes.append(bottom_0_in)

    bl_1 = place_cube(mount_1, offset=[-x_corner, -y_corner, 0])
    br_1 = place_cube(mount_1, offset=[x_corner, -y_corner, 0])
    bottom_1_in = (bl_1 + br_1).hull()
    conn_0_1_in = (br_0 + bl_1).hull()
    outline_shapes.append(conn_0_1_in)
    outline_shapes.append(bottom_1_in)

    bl_2 = place_cube(mount_2, offset=[-x_corner, -y_corner, 0])
    br_2 = place_cube(mount_2, offset=[x_corner, -y_corner, 0])
    bottom_2_in = (bl_2 + br_2).hull()
    conn_1_2_in = (br_1 + bl_2).hull()
    outline_shapes.append(conn_1_2_in)
    outline_shapes.append(bottom_2_in)

    bl_3 = place_cube(mount_3, offset=[-x_corner, -y_corner, 0])
    br_3 = place_cube(mount_3, offset=[x_corner, -y_corner, 0])
    bottom_3_in = (bl_3 + br_3).hull()
    conn_2_3_in = (br_2 + bl_3).hull()
    outline_shapes.append(conn_2_3_in)
    outline_shapes.append(bottom_3_in)

    bl_4 = place_cube(mount_4, offset=[-x_corner, -y_corner, 0])
    br_4 = place_cube(mount_4, offset=[x_corner, -y_corner, 0])
    bottom_4_in = (bl_4 + br_4).hull()
    conn_3_4_in = (br_3 + bl_4).hull()
    outline_shapes.append(conn_3_4_in)
    outline_shapes.append(bottom_4_in)

    # ============= Right outline =============
    tr_4 = place_cube(mount_4, offset=[x_corner, y_corner, 0])
    right = (br_4 + tr_4).hull()
    outline_shapes.append(right)

    # ============= Top outline =============
    tl_4 = place_cube(mount_4, offset=[-x_corner, y_corner, 0])
    top_4_in = (tr_4 + tl_4).hull()
    outline_shapes.append(top_4_in)

    tr_3 = place_cube(mount_3, offset=[x_corner, y_corner, 0])
    tl_3 = place_cube(mount_3, offset=[-x_corner, y_corner, 0])
    top_3_in = (tl_3 + tr_3).hull()
    conn_4_3_in = (tl_4 + tr_3).hull()
    outline_shapes.append(conn_4_3_in)
    outline_shapes.append(top_3_in)

    tr_2 = place_cube(mount_2, offset=[x_corner, y_corner, 0])
    tl_2 = place_cube(mount_2, offset=[-x_corner, y_corner, 0])
    top_2_in = (tl_2 + tr_2).hull()
    conn_3_2_in = (tl_3 + tr_2).hull()
    outline_shapes.append(conn_3_2_in)
    outline_shapes.append(top_2_in)

    tr_1 = place_cube(mount_1, offset=[x_corner, y_corner, 0])
    tl_1 = place_cube(mount_1, offset=[-x_corner, y_corner, 0])
    top_1_in = (tl_1 + tr_1).hull()
    conn_2_1_in = (tl_2 + tr_1).hull()
    outline_shapes.append(conn_2_1_in)
    outline_shapes.append(top_1_in)

    tr_0 = place_cube(mount_0, offset=[x_corner, y_corner, 0])
    tl_0 = place_cube(mount_0, offset=[-x_corner, y_corner, 0])
    top_0_in = (tl_0 + tr_0).hull()
    conn_1_0_in = (tl_1 + tr_0).hull()
    outline_shapes.append(conn_1_0_in)
    outline_shapes.append(top_0_in)

    # ============= Left outline =============
    left = (bl_0 + tl_0).hull()
    outline_shapes.append(left)

    y_out_corner = y_corner + 4.5
    x_out_corner = x_corner + 4.5

    # Curved bottom left corner
    corner_offset = 5.5
    curvature = 4.2
    height = 3
    # Bl 0 corner
    l_0_anchor = np.array([-x_out_corner, -corner_offset, 0])
    bl_0_off = np.array([-corner_offset, -y_out_corner, 0])
    bl_0_curve = utils.sum_shapes(place_curve(
        mount_0,
        start=l_0_anchor,
        end=bl_0_off,
        curvature=[-curvature, -curvature, 0],
        height=height,
    ))
    outline_shapes.append((bl_0_curve + bl_0).hull())

    br_0_off = np.array([corner_offset, -y_out_corner, 0])
    r_0_off = np.array([x_out_corner+3, -corner_offset, 0])
    br_0_curve = utils.sum_shapes(place_curve(
        mount_0,
        start=br_0_off,
        end=r_0_off,
        curvature=[curvature, -curvature, 0],
        height=height,
    ))
    bl_0_off_shape = place_cube(mount_0, offset=bl_0_off.tolist())
    br_0_off_shape = place_cube(mount_0, offset=br_0_off.tolist())
    conn_bottom_0 = (bl_0_off_shape + br_0_off_shape).hull()
    outline_shapes.append(conn_bottom_0)
    # Join inner and outer faces of bottom 0 outline
    outline_shapes.append((conn_bottom_0 + bottom_0_in).hull())
    # 0 br corner
    outline_shapes.append((br_0_curve + br_0).hull())

    l_1_anchor = np.array([-x_out_corner+5., -corner_offset - 16, .22])
    bl_1_off = np.array([-corner_offset+6, -y_out_corner - 2, 0])
    in_curve = 1.4
    bl_1_curve_shapes = place_curve(
        mount_1,
        start=l_1_anchor,
        end=bl_1_off,
        curvature=[-in_curve, in_curve, 0],
        height=height,
    )
    r_0_off_shape = place_cube(mount_0, offset=r_0_off.tolist())
    l_1_anchor_shape = place_cube(mount_1, offset=l_1_anchor.tolist())
    conn_0_1_curve = (r_0_off_shape + l_1_anchor_shape + conn_0_1_in).hull()
    outline_shapes.append(conn_0_1_curve)
    conn_0_1_stripes = []
    # Inner curve between bottom 0 and 1
    for shape in bl_1_curve_shapes:
        conn_0_1_stripes.append((shape + bl_1).hull())
    for stripe_idx in range(1, len(conn_0_1_stripes)):
        outline_shapes.append((conn_0_1_stripes[stripe_idx-1] + conn_0_1_stripes[stripe_idx]).hull())
    # outline_shapes.append((conn_0_1_in + br_0_curve + conn_0_1_stripes[6]).hull())
    curve = 2.4
    br_1_off = np.array([corner_offset, -y_out_corner - 1.5, 0])
    r_1_anchor = np.array([x_out_corner, -corner_offset-4, 0])
    br_1_curve = place_curve(
        mount_1,
        start=br_1_off,
        end=r_1_anchor,
        curvature=[curve, -curve, 0],
        height=height,
    )
    bl_1_off_shape = place_cube(mount_1, offset=bl_1_off.tolist())
    br_1_off_shape = place_cube(mount_1, offset=br_1_off.tolist())
    conn_bottom_1 = (bl_1_off_shape + br_1_off_shape).hull()
    outline_shapes.append(conn_bottom_1)
    # 1 Br corner
    outline_shapes.append((utils.sum_shapes(br_1_curve) + br_1).hull())
    # Join inner and outer faces of bottom 1 outline
    outline_shapes.append((conn_bottom_1 + bottom_1_in).hull())
    # Join inner and outer faces of 1_2 conn with 1 br corner
    # r_1_anchor_shape = place_cube(mount_1, offset=r_1_anchor.tolist())
    # outline_shapes.append((r_1_anchor_shape + conn_1_2_in).hull())

    # Center (2) corners
    l_2_anchor = np.array([-x_out_corner+3., -corner_offset - 16, .22])
    bl_2_off = np.array([-corner_offset+6, -y_out_corner - 2, 0])
    in_curve = 1.4
    bl_2_curve_shapes = place_curve(
        mount_2,
        start=l_2_anchor,
        end=bl_2_off,
        curvature=[-in_curve, in_curve, 0],
        height=height,
    )
    # r_1_off_shape = place_cube(mount_1, offset=r_1_off.tolist())
    # l_1_anchor_shape = place_cube(mount_1, offset=l_1_anchor.tolist())
    # conn_0_1_curve = (r_0_off_shape + l_1_anchor_shape + conn_0_1_in).hull()
    # outline_shapes.append(conn_0_1_curve)
    conn_1_2_stripes = []
    # Inner curve between bottom 1 and 2
    for shape in bl_2_curve_shapes:
        conn_1_2_stripes.append((shape + bl_2).hull())
    outline_shapes.append(utils.sum_shapes(conn_1_2_stripes))
    # Connection between 1 and 2
    outline_shapes.append((br_1_curve[len(br_1_curve)//4] + conn_1_2_in + bl_2_curve_shapes[0]).hull())
    # for stripe_idx in range(1, len(conn_0_1_stripes)):
        # outline_shapes.append((conn_0_1_stripes[stripe_idx-1] + conn_0_1_stripes[stripe_idx]).hull())

    # Bl 3 corner
    l_3_anchor = np.array([-x_out_corner-3, -corner_offset-1.5, 0])
    bl_3_off = np.array([-corner_offset+2, -y_out_corner, 0])
    bl_3_curve = utils.sum_shapes(place_curve(
        mount_3,
        start=l_3_anchor,
        end=bl_3_off,
        curvature=[-curvature, -curvature, 0],
        height=height,
    ))
    outline_shapes.append((bl_3_curve + bl_3).hull())


    # Make crosses
    # for point in mount_centers:
    #     shape_1 = Cube([19, 1, 3], center=True)
    #     shape_2 = Cube([1, 18.5, 3], center=True)
    #     shape = shape_1 + shape_2
    #     shape = shape.rotate(point.rotation.tolist())
    #     shape = shape.translate(point.translation.tolist())
    #     outline_shapes.append(shape)

    # Make corners
    # for point in mount_centers:
    #     shape = Cube([.1, .1, 3], center=True)
    #     shape = utils.sum_shapes([
    #         shape.translate([9.41, -9.13, 0]),
    #         shape.translate([-9.41, 9.13, 0]),
    #         shape.translate([9.41, 9.13, 0]),
    #         shape.translate([-9.41, -9.13, 0]),
    #     ])
    #     shape = shape.rotate(point.rotation.tolist())
    #     shape = shape.translate(point.translation.tolist())
    #     outline_shapes.append(shape)
    return utils.sum_shapes(outline_shapes).turn_on_debug()


def generate_thumb_outline(state, draft_version):
    if draft_version:
        interpolation_segments = 29
    else:
        interpolation_segments = 48
    thin_shapes = generate_thumb_outer_curve_outline2(
        state,
        interpolation_segments=interpolation_segments,
    )
    return thin_shapes

