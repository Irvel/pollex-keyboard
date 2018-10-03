from datetime import datetime
from openpyscad import Cube, Cylinder

import keyboard_state
import keyboard_outline
import numpy as np
import utils


INDEX_SIDE = 0
INDEX = 1
MIDDLE = 2
RING = 3
PINKY = 4
BOTTOM_ROW = 0
CENTER_ROW = 1
TOP_ROW = 2


def generate_back(plate, outline, plate_state, draft_version=True, outline_size=3.6):
    thickness = 2
    if draft_version:
        detail = 26
        interpolation_segments = 16
        make_top_hull = True
    else:
        detail = 186
        interpolation_segments = 148
        make_top_hull = True

    def top_double_bevel(initial_radius=51, first_length=1, first_angle=25, second_length=1, second_angle=50):
        # 90° Amounts to a fully vertical transition while 0° is no transition.
        first_radians = ((90 - first_angle) * np.pi) / 180

        # Vertical distance from bevel 1 to bevel 2.
        first_height = np.cos(first_radians) * first_length
        first_radius_delta = np.sin(first_radians) * first_length

        # Radius of the intermediate cylinder.
        middle_radius = initial_radius + first_radius_delta
        small_sub_bevel = Cylinder(r1=initial_radius, r2=middle_radius,
                                   h=first_height, _center=False, _fn=detail)

        second_radians = ((90 - second_angle) * np.pi) / 180
        second_height = np.cos(second_radians) * second_length
        second_radius_delta = np.sin(second_radians) * second_length
        final_radius = middle_radius + second_radius_delta
        large_sub_bevel = Cylinder(r1=middle_radius, r2=final_radius,
                                   h=second_height, _center=False, _fn=detail)

        # Start the transition from where the middle cylinder ends vertically.
        large_sub_bevel = large_sub_bevel.translate([0, 0, first_height])
        total_height = first_height + second_height
        return small_sub_bevel + large_sub_bevel, total_height, final_radius

    def make_back_arc_2(column_idx, offset=[0, 0, 0], visualize_anchors=False):
        center_mount = plate_state.mount_matrix[CENTER_ROW][INDEX_SIDE]
        center_points = center_mount.fetch_double_outer_sides(offset_to_corner=0)
        bottom_mount = plate_state.mount_matrix[BOTTOM_ROW][column_idx]
        bottom_points = [center_points[1]] + bottom_mount.points
        top_mount = plate_state.mount_matrix[TOP_ROW][column_idx]
        top_points = [center_points[0]] + top_mount.points[::-1]

        final_curve = None
        start_y = bottom_mount.points[0].translation.y_comp
        arcs = []
        for idx, (point_a, point_b) in enumerate(zip(bottom_points,
                                                     top_points)):
            bowling = (idx * 1) / len(bottom_points)
            bowling = -(point_a.translation.y_comp - start_y)
            if idx == 0:
                bottom_anchor_offset = [0, 0, -10]
                top_anchor_offset = [0, 0, -10]
            elif idx == 1:
                bottom_anchor_offset = [0, -20, -52]
                top_anchor_offset = [0, 20, -52]
            elif idx == len(top_points)-1:
                bottom_anchor_offset = [
                    0,
                    -25 + bowling / 2,
                    -43 - bowling
                ]
                top_anchor_offset = [
                    0,
                    25 - bowling / 2,
                    -43 - bowling
                ]
            else:
                bottom_anchor_offset = [
                    25 - (idx * 3.6),
                    -19 + bowling / 2,
                    -43 - bowling
                ]
                top_anchor_offset = [
                    25 - (idx * 3.6),
                    19 - bowling / 2,
                    -43 - bowling
                ]
            bottom_anchor_offset = keyboard_state.rotate(
                bottom_anchor_offset,
                bottom_mount.rotation
            )
            top_anchor_offset = keyboard_state.rotate(
                top_anchor_offset,
                top_mount.rotation
            )

            bottom_anchor = keyboard_outline.get_middle_point(
                point_a=point_a,
                point_b=point_b,
                offset=bottom_anchor_offset,
            )
            top_anchor = keyboard_outline.get_middle_point(
                point_a=point_a,
                point_b=point_b,
                offset=top_anchor_offset,
            )
            print(
                f"idx: {idx} bottom_anchor_offset:",
                f"[{bottom_anchor_offset[0]:.3f}, ",
                f"{bottom_anchor_offset[1]:.3f}, ",
                f"{bottom_anchor_offset[2]:.3f}]",
            )

            if visualize_anchors:
                anchor_a = Cube(3, center=True).rotate(top_anchor.rotation.tolist())
                anchor_a = anchor_a.translate(top_anchor.translation.tolist())
                anchor_a = anchor_a.color([.6, .7, .84])
                if not final_curve:
                    final_curve = anchor_a
                else:
                    final_curve += anchor_a
                anchor_b = Cube(3, center=True).rotate(bottom_anchor.rotation.tolist())
                anchor_b = anchor_b.translate(bottom_anchor.translation.tolist())
                anchor_b = anchor_b.color([.8, .7, .84])
                final_curve += anchor_b

            translation_trajectory = utils.interpolate_cubic_bezier(
                start=point_a.translation,
                end=point_b.translation,
                bezier_1=bottom_anchor.translation,
                bezier_2=top_anchor.translation,
                segments=interpolation_segments
            )
            rotation_a = point_a.rotation
            rotation_b = np.array([180, 0, 0]) + point_b.rotation
            rotation_trajectory = utils.linear_interpolate(
                rotation_a,
                rotation_b,
                interpolation_segments,
                deadband_percentage=4
            )

            arc = []
            for point, rotation in zip(translation_trajectory, rotation_trajectory):
                step_shape = Cube([.1, .1, .1], center=True)
                step_shape = step_shape.rotate(rotation.tolist()).translate(point)
                arc.append(step_shape)
            if not final_curve:
                final_curve = utils.sum_shapes(arc)
            else:
                final_curve += utils.sum_shapes(arc)
            arcs.append(arc)

        return final_curve.hull(), arcs

    def make_back_arc_2_5(column_idx, offset=[0, 0, 0], visualize_anchors=False):
        center_mount = plate_state.mount_matrix[CENTER_ROW][INDEX_SIDE]
        center_points = center_mount.fetch_double_outer_sides(offset_to_corner=0)
        bottom_mount = plate_state.mount_matrix[BOTTOM_ROW][column_idx]
        bottom_points = [center_points[1]] + bottom_mount.points
        top_mount = plate_state.mount_matrix[TOP_ROW][column_idx]
        top_points = [center_points[0]] + top_mount.points[::-1]

        final_curve = None
        start_y = bottom_mount.points[0].translation.y_comp
        start_z = bottom_mount.points[1].translation.z_comp
        start_x = bottom_mount.points[1].translation.x_comp

        for idx, (point_a, point_b) in enumerate(zip(bottom_points, top_points)):
            away_outline = [1.45, 1.45, -1.5]
            away_outline_a = keyboard_state.rotate(
                away_outline,
                point_a.rotation
            )
            bottom_points[idx] += away_outline_a
            away_outline = [1.45, -1.45, -1.5]
            away_outline_b = keyboard_state.rotate(
                away_outline,
                point_b.rotation
            )
            top_points[idx] += away_outline_b
        arcs = []
        prev_point = 0
        baseline_z_down = 0
        accum_delta = baseline_z_down
        for point_idx, (point_a, point_b) in enumerate(zip(bottom_points,
                                                           top_points)):
            delta = 0
            if prev_point and point_idx > 2 and point_idx < len(top_points) - 1:
                prev_x = prev_point.translation.x_comp
                prev_y = prev_point.translation.y_comp
                prev_z = prev_point.translation.z_comp
                curr_x = point_a.translation.x_comp
                curr_y = point_a.translation.y_comp
                curr_z = point_a.translation.z_comp
                delta = curr_z - prev_z

                delta = (prev_x - curr_x)**2 + (prev_z - curr_z)**2
                delta = np.sqrt(delta)

                delta = (prev_x - curr_x)**2 + (prev_z - curr_z)**2
                delta = np.sqrt(delta)
                delta += delta * .2
                accum_delta += delta
            if point_idx == len(top_points) - 1:
                accum_delta = 0

            prev_point = point_a
            progress = (point_idx / len(bottom_points)) * 0.5
            bowling = (point_a.translation.y_comp - start_y) + progress
            if point_idx == 0:
                bottom_anchor_offset = [0, -1, -2]
                top_anchor_offset = [0, 1, -2]
            elif point_idx == 1:
                bottom_anchor_offset = [0, -6, -17]
                top_anchor_offset = [0, 6, -17]
            elif point_idx == len(bottom_points) - 1:
                bottom_anchor_offset = [0, -13, -25.5 + bowling]
                top_anchor_offset = [0, 13, -25.5 + bowling]
            else:
                bottom_anchor_offset = [
                    -accum_delta,
                    -13,
                    -27 + bowling
                ]
                top_anchor_offset = [
                    -accum_delta,
                    13,
                    -27 + bowling
                ]
            bottom_anchor_offset = keyboard_state.rotate(
                bottom_anchor_offset,
                bottom_mount.rotation
            )
            top_anchor_offset = keyboard_state.rotate(
                top_anchor_offset,
                top_mount.rotation
            )

            bottom_anchor = keyboard_outline.get_middle_point(
                point_a=point_a,
                point_b=point_b,
                offset=bottom_anchor_offset,
            )
            top_anchor = keyboard_outline.get_middle_point(
                point_a=point_a,
                point_b=point_b,
                offset=top_anchor_offset,
            )

            translation_trajectory = utils.interpolate_cubic_bezier(
                start=point_a.translation,
                end=point_b.translation,
                bezier_1=bottom_anchor.translation,
                bezier_2=top_anchor.translation,
                segments=interpolation_segments
            )
            rotation_a = point_a.rotation
            rotation_b = np.array([180, 0, 0]) + point_b.rotation
            rotation_trajectory = utils.linear_interpolate(
                rotation_a,
                rotation_b,
                interpolation_segments,
                deadband_percentage=4
            )
            # We want the corner rings to align at the
            # middle of their trajectory. This is why we linearly map
            # the trajectory range from 0 to 180 and take the sin
            # of it because sin(90) = 1
            angle_rep = (point_idx * 180) / (len(top_points) + 1)
            offset_multiplier = np.sin(np.radians(angle_rep)) ** 2
            align_offset = (offset_multiplier * 1.1)

            arc = []
            for idx, (point, rotation) in enumerate(zip(translation_trajectory,
                                                        rotation_trajectory)):
                if idx == 0 or idx == (len(translation_trajectory) - 1):
                    outline_align = 0
                else:
                    outline_align = 1

                step_shape = Cube([3, 3, .1], center=True)
                step_shape = step_shape.translate([0, align_offset * outline_align, 0])
                step_shape = step_shape.rotate(rotation.tolist()).translate(point)
                arc.append(step_shape)
            if not final_curve:
                final_curve = utils.sum_shapes(arc)
            else:
                final_curve += utils.sum_shapes(arc)
            arcs.append(arc)

        return final_curve.hull(), arcs

    def make_back_arc_2_6(column_idx, offset=[0, 0, 0], visualize_anchors=False):
        center_mount = plate_state.mount_matrix[CENTER_ROW][PINKY]
        center_points = center_mount.fetch_double_outer_sides(offset_to_corner=0)
        pinky_mount = plate_state.mount_matrix[BOTTOM_ROW][PINKY]
        pinky_points = pinky_mount.fetch_double_outer_sides(offset_to_corner=0)
        bottom_mount = plate_state.mount_matrix[BOTTOM_ROW][column_idx]
        bottom_points = bottom_mount.points + [pinky_points[1], center_points[1]]
        top_mount = plate_state.mount_matrix[TOP_ROW][column_idx]
        top_points = top_mount.points[::-1] + [pinky_points[0], center_points[0]]

        final_curve = None
        start_y = bottom_mount.points[0].translation.y_comp
        start_z = bottom_mount.points[1].translation.z_comp
        start_x = bottom_mount.points[1].translation.x_comp

        for idx, (point_a, point_b) in enumerate(zip(bottom_points,
                                                     top_points)):
            if idx == 0:
                away_outline = [1.45, 1.45, -1.5]
            else:
                away_outline = [-1.45, 1.45, -1.5]
            away_outline_a = keyboard_state.rotate(
                away_outline,
                point_a.rotation
            )
            bottom_points[idx] += away_outline_a
            if idx == 0:
                away_outline = [-1.45, -1.45, -1.5]
            else:
                away_outline = [-1.45, -1.45, -1.5]
            away_outline_b = keyboard_state.rotate(
                away_outline,
                point_b.rotation
            )
            top_points[idx] += away_outline_b
        arcs = []
        for point_idx, (point_a, point_b) in enumerate(zip(bottom_points,
                                                           top_points)):
            progress = (point_idx / len(bottom_points)) * 20
            bowling = (point_a.translation.y_comp - start_y) + progress
            # This is the last arc
            if point_idx == 2:
                bottom_anchor_offset = [0, -5, -50]
                top_anchor_offset = [0, 5, -50]
            elif point_idx == 3:
                bottom_anchor_offset = [50, -1, 0]
                top_anchor_offset = [30, 1, 0]
            else:
                bottom_anchor_offset = [
                    0,
                    -6,
                    -56 + bowling
                ]
                top_anchor_offset = [
                    0,
                    6,
                    -56 + bowling
                ]
            bottom_anchor_offset = keyboard_state.rotate(
                bottom_anchor_offset,
                bottom_mount.rotation
            )
            top_anchor_offset = keyboard_state.rotate(
                top_anchor_offset,
                top_mount.rotation
            )

            bottom_anchor = keyboard_outline.get_middle_point(
                point_a=point_a,
                point_b=point_b,
                offset=bottom_anchor_offset,
            )
            top_anchor = keyboard_outline.get_middle_point(
                point_a=point_a,
                point_b=point_b,
                offset=top_anchor_offset,
            )

            translation_trajectory = utils.interpolate_cubic_bezier(
                start=point_a.translation,
                end=point_b.translation,
                bezier_1=bottom_anchor.translation,
                bezier_2=top_anchor.translation,
                segments=interpolation_segments
            )
            rotation_a = point_a.rotation
            rotation_b = np.array([180, 0, 0]) + point_b.rotation
            rotation_trajectory = utils.linear_interpolate(
                rotation_a,
                rotation_b,
                interpolation_segments,
                deadband_percentage=4
            )
            # We want the corner rings to align at the
            # middle of their trajectory. This is why we linearly map
            # the trajectory range from 0 to 180 and take the sin
            # of it because sin(90) = 1
            angle_rep = (point_idx * 180) / len(top_points)
            offset_multiplier = np.sin(np.radians(angle_rep))
            align_offset = (offset_multiplier * 1.12)

            arc = []
            for idx, (point, rotation) in enumerate(zip(translation_trajectory,
                                                        rotation_trajectory)):
                if idx < len(translation_trajectory) * .1 or idx > len(translation_trajectory) * .9:
                    outline_align = 0
                else:
                    outline_align = 1

                step_shape = Cube([4, 4, .1], center=True)
                step_shape = step_shape.translate([0, align_offset * outline_align, 0])
                step_shape = step_shape.rotate(rotation.tolist()).translate(point)
                arc.append(step_shape)
            if not final_curve:
                final_curve = utils.sum_shapes(arc)
            else:
                final_curve += utils.sum_shapes(arc)
            arcs.append(arc)

        return final_curve.hull(), arcs

    def make_back_arc_3(column_idx, offset_a=[0, 0, 0], offset_b=[0, 0, 0], visualize_anchors=False):
        bottom_mount = plate_state.mount_matrix[BOTTOM_ROW][column_idx]
        bottom_points = bottom_mount.points
        top_mount = plate_state.mount_matrix[TOP_ROW][column_idx]
        top_points = top_mount.points[::-1]

        for idx, (point_a, point_b) in enumerate(zip(bottom_points, top_points)):
            away_outline = [0, 1.95, -1.5]
            away_outline_a = keyboard_state.rotate(
                away_outline,
                point_a.rotation
            )
            bottom_points[idx] += away_outline_a
            away_outline = [0, -1.95, -1.5]
            away_outline_b = keyboard_state.rotate(
                away_outline,
                point_b.rotation
            )
            top_points[idx] += away_outline_b
        delta_bottom = (bottom_points[-1].translation -
                        bottom_points[1].translation)
        delta_top = (top_points[-1].translation -
                     top_points[1].translation)
        final_curves = []
        for idx, (point_a, point_b) in enumerate(zip(bottom_points,
                                                     top_points)):
            if idx == len(bottom_points):
                offset_a += delta_bottom
                offset_b += delta_bottom
            bottom_anchor_offset = np.array(offset_a) * np.array([1, -1, -1])
            top_anchor_offset = np.array(offset_b) * np.array([1, 1, -1])

            bottom_anchor_offset = keyboard_state.rotate(
                bottom_anchor_offset,
                bottom_mount.rotation
            )
            top_anchor_offset = keyboard_state.rotate(
                top_anchor_offset,
                top_mount.rotation
            )

            bottom_anchor = keyboard_outline.get_middle_point(
                point_a=point_a,
                point_b=point_b,
                offset=bottom_anchor_offset,
            )
            top_anchor = keyboard_outline.get_middle_point(
                point_a=point_a,
                point_b=point_b,
                offset=top_anchor_offset,
            )

            translation_trajectory = utils.interpolate_cubic_bezier(
                start=point_a.translation,
                end=point_b.translation,
                bezier_1=bottom_anchor.translation,
                bezier_2=top_anchor.translation,
                segments=interpolation_segments
            )
            rotation_a = point_a.rotation
            rotation_b = np.array([180, 0, 0]) + point_b.rotation
            rotation_trajectory = utils.linear_interpolate(
                rotation_a,
                rotation_b,
                interpolation_segments,
                deadband_percentage=4
            )

            arc = []
            for point, rotation in zip(translation_trajectory, rotation_trajectory):
                step_shape = Cube([.1, 4, .1], center=True)
                step_shape = step_shape.rotate(rotation.tolist()).translate(point)
                arc.append(step_shape)
            final_curves.append(arc)
        return final_curves

    def cut_front(top_cap, outline):
        half_cutter = Cube(160, center=True)
        half_cutter = half_cutter.rotate(
            plate_state.mount_matrix[CENTER_ROW][INDEX_SIDE]
                       .center
                       .rotation
                       .tolist()
        )
        half_cutter = half_cutter.translate([20, 36, 0])
        # return half_cutter
        half_outline = (outline - half_cutter).hull()
        shifted_half = half_outline.translate([0, 0, 3])
        return top_cap - half_outline - half_cutter - shifted_half

    print(f"\n===== Generating back with {interpolation_segments} segments =====")
    start_time = datetime.now()
    # top_cap2, top_arcs = make_back_arc_2(column_idx=INDEX_SIDE)
    print("Generating INDEX_SIDE back segments...")
    top_cap2, top_arcs = make_back_arc_2_5(column_idx=INDEX_SIDE)
    shapes = top_arcs
    top_cap3 = utils.sum_shapes(top_arcs[0]).hull()
    print("Generating INDEX back segments...")
    shapes.extend(
        make_back_arc_3(
            column_idx=INDEX,
            offset_a=[0, -5, 61],
            offset_b=[0, 16, 55],
        )
    )
    print("Generating MIDDLE back segments...")
    shapes.extend(
        make_back_arc_3(
            column_idx=MIDDLE,
            offset_a=[0, 3, 53],
            offset_b=[0, 3, 50],
        )
    )
    print("Generating RING back segments...")
    shapes.extend(
        make_back_arc_3(
            column_idx=RING,
            offset_a=[0, 6, 57],
            offset_b=[0, 6, 57],
        )
    )
    # shapes.extend(make_back_arc_3(column_idx=MIDDLE, offset=[0, 12, 63]))
    # shapes.extend(make_back_arc_3(column_idx=RING, offset=[0, 12, 62]))
    # print("Generating RING back segments...")
    # _, pinky_arcs = make_back_arc_3(column_idx=RING)
    # shapes.extend(pinky_arcs)
    # _, pinky_arcs = make_back_arc_2_6(column_idx=PINKY)
    # shapes.extend(pinky_arcs)
    print(f"Stitching {len(shapes) * len(shapes[0])} back segments with hulls...")
    for shape_idx in range(len(shapes)):
        current_shape = shapes[shape_idx]
        if shape_idx < len(shapes) - 1:
            next_shape = shapes[shape_idx + 1]
            vertical_stripes = []
            for top, bottom in zip(current_shape, next_shape):
                vertical_stripes.append((top + bottom).hull())
            vert_join = []
            for stripe_idx in range(1, len(vertical_stripes)):
                stripe_a = vertical_stripes[stripe_idx - 1]
                stripe_b = vertical_stripes[stripe_idx]
                vert_join.append((stripe_a + stripe_b).hull())
            top_cap3 += utils.sum_shapes(vert_join)
    end_time = datetime.now()
    print(f"Finished stitching back in {end_time - start_time}")
    # top_cap3 = sum_shapes(shapes)
    # top_cap3 += make_back_arc_3(column_idx=PINKY)

    return top_cap3
    return top_cap3 + top_cap2
    # top_cap = make_back_arc(radius=38, column_idx=INDEX, shape="cube", size_x=8, size_y=1, height=3)

    # top_bevel = remove_corners(top_bevel, x_offset=0)
    # top_bevel = remove_corners(top_bevel, x_offset=.1)
    # return top_bevel - (cube + cube2 + cylinder)
    # top_bevel = top_bevel - (cube + cube2)
    # return make_top_cap(radius=38)
    # return top_cap2 - (outline.hull())
    return cut_front(top_cap2, outline)