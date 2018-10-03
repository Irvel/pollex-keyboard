from datetime import datetime
from multiprocessing import Pool
from openpyscad import Cube

import numpy as np
import keyboard_state as utils


def points_in_same_plane(point_a, point_b):
    same_x = np.isclose(point_a.translation.x_comp, point_b.translation.x_comp)
    same_y = np.isclose(point_a.translation.y_comp, point_b.translation.y_comp)
    return same_x or same_y


def sum_shapes(shapes):
    # The built-in Python sum() doesn't work with shapes
    if len(shapes) == 1:
        return shapes[0]
    total = shapes[0]
    for shape in shapes[1:]:
        total += shape
    return total


def interpolate_cuadratic_bezier(point_a, point_b, control_point, segments=10):
    curve_points = []
    for seg in range(segments):
        t = seg / segments
        curve_point = ((1-t)**2 * point_a + 2*(1-t)*t*control_point + t**2 * point_b)
        curve_points.append(curve_point)
    return curve_points


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
    return sum_shapes(walls).color([.4, .6, .5]), corner_shapes


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
    return sum_shapes(walls).turn_on_debug(), corner_shapes


def join_outlines(shapes_a, shapes_b):
    assert len(shapes_b) == len(shapes_a)
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
        shape_c = next(iter_a, shape_a)
        shape_d = next(iter_b, shape_b)
        hulls.append((shape_a + shape_b + shape_c).hull())
        hulls.append((shape_a + shape_b + shape_d).hull())
        hulls.append((shape_a + shape_c + shape_d).hull())
    print("\nReducing hulls into a single shape...")
    return sum_shapes(hulls).color([.5, .8, .7])


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

def out_outline(keyboard_state, outer_expand, curvature, height_expand, offset_to_corner, interpolation_segments=18, shrink_sides=False):
    INDEX_SIDE = 0
    INDEX = 1
    MIDDLE = 2
    RING = 3
    PINKY = 4
    TOP_ROW = 2

    walls = []
    corner_shapes = []
    for key_mount in keyboard_state.border_mounts:
        key_mount.points = []
        if shrink_sides and (key_mount.is_left or key_mount.is_right):
            key_mount.side_expand_distance = outer_expand - 3
        elif key_mount.col_idx == INDEX and (key_mount.row_idx == TOP_ROW):
            key_mount.side_expand_distance = outer_expand - .8
        else:
            key_mount.side_expand_distance = outer_expand
        corner_points = key_mount.fetch_double_outer_sides(offset_to_corner=offset_to_corner)
        if key_mount.col_idx == RING and (key_mount.row_idx == TOP_ROW):
            # key_mount.points.extend(corner_points)
            continue
        if key_mount.col_idx == PINKY and (key_mount.row_idx == TOP_ROW):
            key_mount.points.extend(corner_points)
            continue

        if key_mount.col_idx == MIDDLE and key_mount.row_idx == TOP_ROW:
            middle = keyboard_state.mount(TOP_ROW, MIDDLE)
            ring = keyboard_state.mount(TOP_ROW, RING)
            pinky = keyboard_state.mount(TOP_ROW, PINKY)

            middle.side_expand_distance = outer_expand - 1
            ring.side_expand_distance = outer_expand - 3
            pinky.side_expand_distance = outer_expand - 3  # This comes from the side shrinkage

            p0, p1 = middle.fetch_double_outer_sides(offset_to_corner=offset_to_corner)
            middle.points = [p0, p1]
            _, p4, p3, _ = pinky.fetch_double_outer_sides(offset_to_corner=offset_to_corner)
            p5, _, _, p2 = pinky.fetch_double_outer_sides(offset_to_corner=0)
            # p5, p4, p3, p2 = pinky.fetch_double_outer_sides(offset_to_corner=offset_to_corner)
            # bezier_offset = get_corner_normal(middle, offset=curvature)
            bezier_offset = utils.rotate([25, 25, 0], middle.rotation)
            bezier_control = get_middle_point(
                point_a=p0,
                point_b=p5,
                offset=bezier_offset,
            )
            trajectory = interpolate_cuadratic_bezier(
                point_a=p0,
                point_b=p5,
                control_point=bezier_control,
                segments=int(interpolation_segments * 1.6) + 3  # All outlines must have same amount of segments
            )
            corner_points = [p5] + trajectory[::-1] + [p0, p1]
            ring.points = trajectory[::-1]

        elif len(corner_points) == 4:
            _, p1, p2, _ = corner_points
            p0, _, _, p3 = key_mount.fetch_double_outer_sides(offset_to_corner=0)
            if key_mount.col_idx == INDEX_SIDE and (key_mount.row_idx == TOP_ROW):
                key_mount.side_expand_distance = outer_expand + 1.6
                p0, _, _, _ = key_mount.fetch_double_outer_sides(offset_to_corner=0)
                _, p1, _, _ = key_mount.fetch_double_outer_sides(offset_to_corner=offset_to_corner+6)
                bezier_offset = get_corner_normal(key_mount, offset=curvature+1)
            else:
                bezier_offset = get_corner_normal(key_mount, offset=curvature)

            bezier_control = get_middle_point(
                point_a=p1,
                point_b=p2,
                offset=bezier_offset,
            )
            trajectory = interpolate_cuadratic_bezier(
                point_a=p1,
                point_b=p2,
                control_point=bezier_control,
                segments=interpolation_segments
            )
            corner_points = [p0] + trajectory + [p3]
            key_mount.points.extend(corner_points)
        else:
            key_mount.points.extend(corner_points)

        for corner_point in corner_points:
            shape = Cube([.1, .1, keyboard_state.wall_thickness], center=True)
            shape = shape + shape.translate([0, 0, height_expand])
            shape = shape.rotate(corner_point.rotation.tolist())
            shape = shape.translate(corner_point.translation.tolist())
            if corner_shapes:
                walls.append((corner_shapes[-1] + shape).hull())
            corner_shapes.append(shape)
    walls.append((corner_shapes[0] + corner_shapes[-1]).hull())
    return sum_shapes(walls).color([.6, .7, .2]), corner_shapes


def generate_outer_curve_outline(keyboard_state, outer_expand, curvature, height_expand, offset_to_corner, interpolation_segments=18, shrink_sides=False):
    walls = []
    corner_shapes = []
    RING = 3
    PINKY = 4
    TOP_ROW = 2

    for key_mount in keyboard_state.border_mounts:
        key_mount.points = []
        key_mount.side_expand_distance = outer_expand
        corner_points = key_mount.fetch_double_outer_sides(offset_to_corner=offset_to_corner)
        if key_mount.col_idx == RING and (key_mount.row_idx == TOP_ROW):
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
            trajectory = interpolate_cuadratic_bezier(
                point_a=p0,
                point_b=p1,
                control_point=bezier_control,
                segments=interpolation_segments//2
            )
            corner_points = [p0] + trajectory + [p1]

        if key_mount.col_idx == PINKY and (key_mount.row_idx == TOP_ROW):
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
            trajectory_top = interpolate_cuadratic_bezier(
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
            trajectory_bottom = interpolate_cuadratic_bezier(
                point_a=p0,
                point_b=p1,
                control_point=bezier_control,
                segments=interpolation_segments//3 + 1
            )
            bezier_offset = get_corner_normal(key_mount, offset=curvature)
            bezier_control = get_middle_point(
                point_a=p1,
                point_b=p2,
                offset=bezier_offset,
            )
            trajectory_corner = interpolate_cuadratic_bezier(
                point_a=p1,
                point_b=p2,
                control_point=bezier_control,
                segments=interpolation_segments//3 + 1
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
            trajectory = interpolate_cuadratic_bezier(
                point_a=p1,
                point_b=p2,
                control_point=bezier_control,
                segments=interpolation_segments
            )
            corner_points = [p0] + trajectory + [p3]

        key_mount.points.extend(corner_points)
        for corner_point in corner_points:
            shape = Cube([.1, .1, keyboard_state.wall_thickness], center=True)
            shape = shape + shape.translate([0, 0, height_expand])
            shape = shape.rotate(corner_point.rotation.tolist())
            shape = shape.translate(corner_point.translation.tolist())
            if corner_shapes:
                walls.append((corner_shapes[-1] + shape).hull())
            corner_shapes.append(shape)
    walls.append((corner_shapes[0] + corner_shapes[-1]).hull())
    return sum_shapes(walls).color([.6, .7, .2]), corner_shapes


def generate_outline(keyboard_state, draft_version):
    if draft_version:
        interpolation_segments = 10
    else:
        interpolation_segments = 42
    start_time = datetime.now()
    print(f"==== Generating outline with {interpolation_segments} segments ====")
    print("Generating thin_outline...")
    thin_outline, thin_shapes = generate_outer_curve_outline(
        keyboard_state,
        outer_expand=0,
        curvature=0,
        height_expand=0,
        offset_to_corner=0,
        interpolation_segments=interpolation_segments,
    )
    print("Generating thin_outline_up...")
    thin_outline_up, thin_shapes_up = generate_outer_curve_outline(
        keyboard_state,
        outer_expand=0,
        curvature=0,
        height_expand=3,
        offset_to_corner=0,
        interpolation_segments=interpolation_segments,
    )
    print("Generating thin_outline_up_out...")
    thin_outline_up_out, thin_shapes_up_out = generate_outer_curve_outline(
        keyboard_state,
        outer_expand=3,
        curvature=1,
        height_expand=3,
        offset_to_corner=0,
        interpolation_segments=interpolation_segments,
    )
    print("Generating thin_outline_up_up_out...", end=" ")
    thin_outline_up_up_out, thin_shapes_up_up_out = generate_outer_curve_outline(
        keyboard_state,
        outer_expand=3,
        curvature=1,
        height_expand=6,
        offset_to_corner=0,
        interpolation_segments=interpolation_segments,
    )
    print(len(thin_shapes_up_up_out), "shapes.")
    print("Generating outer_outline...", end=" ")
    outer_outline, outer_shapes = out_outline(
        keyboard_state,
        outer_expand=12,
        curvature=6,
        height_expand=6,
        offset_to_corner=6,
        interpolation_segments=interpolation_segments,
        shrink_sides=True,
    )
    print(len(outer_shapes), "shapes.")

    skeleton_outlines = [
        thin_outline,
        thin_outline_up,
        thin_outline_up_out,
        thin_outline_up_up_out.color([.7, .3, .5]),
        outer_outline,
    ]
    end_time = datetime.now()
    print(f"Finished generating outlines in {end_time - start_time}")
    if draft_version:
        return sum_shapes(skeleton_outlines)

    print("\nJoining outlines with hulls...")
    outer_hull = []
    with Pool(6) as pool:
        print("Joining thin_shapes with thin_shapes_up...")
        join_path = [
            (thin_shapes, thin_shapes_up),
            (thin_shapes_up, thin_shapes_up_out),
            (thin_shapes_up_out, thin_shapes_up_up_out),
            (thin_shapes_up_up_out, outer_shapes),
        ]
        outer_hull = pool.starmap(join_outlines, join_path)
        """
        join_outlines(thin_shapes, thin_shapes_up))
        print("\nJoining thin_shapes_up with thin_shapes_up_out...")
        outer_hull.append(join_outlines(thin_shapes_up, thin_shapes_up_out))
        print("\nJoining thin_shapes_up_out with thin_shapes_up_up_out...")
        outer_hull.append(join_outlines(thin_shapes_up_out, thin_shapes_up_up_out))
        print("\nJoining thin_shapes_up_up_out with outer_shapes...")
        outer_hull.append(join_outlines(thin_shapes_up_up_out, outer_shapes))
        """
    end_time = datetime.now()
    print(f"Finished joining outlines in {end_time - start_time}")
    return sum_shapes(outer_hull)
