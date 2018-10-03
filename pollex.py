from pykeeb import DSA_KEY_WIDTH, Keyboard_matrix, project, Keyswitch_mount
from openpyscad import Cube, Sphere, Cylinder, Minkowski, Circle, Polygon

import numpy as np

# Magic numbers are harder to deal with directly
INDEX_SIDE = 0
INDEX = 1
MIDDLE = 2
RING = 3
PINKY = 4
BOTTOM_ROW = 0
CENTER_ROW = 1
TOP_ROW = 2

# 13.80 was too much.
mount_width = 13.60
mount_height = 13.60
plate_thickness = 3
mount_width = 18.915


def sum_shapes(shapes):
    # The built-in Python sum() doesn't work with shapes
    if len(shapes) == 1:
        return shapes[0]
    total = shapes[0] 
    for shape in shapes[1:]:
        total += shape
    return total


def rotate_point(point, angle_list):
    # angle_list is x y z angles
    # Force a column vector
    point = np.array(point).reshape((3,1))

    theta_x = np.radians(angle_list[0])
    x_rot_mat = [[1.0,                0.0,                 0.0],
                 [0.0,    np.cos(theta_x),    -np.sin(theta_x)],
                 [0.0,    np.sin(theta_x),     np.cos(theta_x)]]
    x_rot_mat = np.array(x_rot_mat)

    theta_y = np.radians(angle_list[1])
    y_rot_mat = [[np.cos(theta_y),     0.0,     np.sin(theta_y)],
                 [             0.0,    1.0,                 0.0],
                 [-np.sin(theta_y),    0.0,     np.cos(theta_y)]]
    y_rot_mat = np.array(y_rot_mat)

    theta_z = np.radians(angle_list[2])
    z_rot_mat = [[np.cos(theta_z),    -np.sin(theta_z),     0.0],
                 [np.sin(theta_z),     np.cos(theta_z),     0.0],
                 [            0.0,                  0.0,    1.0]]
    z_rot_mat = np.array(z_rot_mat)

    rotated_point = np.dot(x_rot_mat, point)
    rotated_point = np.dot(y_rot_mat, rotated_point)
    rotated_point = np.dot(z_rot_mat, rotated_point)
    return [p[0] for p in rotated_point.tolist()]


def translate_point(point, shift_list):
    translated_x = point[0] + shift_list[0]
    translated_y = point[1] + shift_list[1]
    translated_z = point[2] + shift_list[2]
    return  [translated_x, translated_y, translated_z]


def get_coordinates(transformations, origin=[0,0,0]):
    point = origin
    for transformation in transformations:
        rotation_angles = transformation[3:]
        point = rotate_point(point, rotation_angles)

        translations = transformation[:3]
        point = translate_point(point, translations)
    return point


def get_rotation_angles(transformations):
    rotation_angles = [0.0, 0.0, 0.0]
    for transformation in transformations:
        a, b, c = transformation[3:]
        rotation_angles[0] += a
        rotation_angles[1] += b
        rotation_angles[2] += c
    return rotation_angles


def make_arc(length, thickness, rot=[0,90,45]):
    points = []
    for t in np.linspace(0.01, 1.0, num=60).tolist():
        x = (1-t) * 2 * 0 + 2*(1-t)*t*0.5 + t**2 * 1
        y = (1-t) * 2 * 0 + 2*(1-t)*t*1 + t**2 * 0
        p1 = np.array([1.0, 1.0]) * thickness
        p2 = np.array([0.2, 0.22]) * thickness
        p3 = np.array([-0.1, 0.9]) * thickness
        p4 = np.array([0.0, 0.0]) * thickness
        coords = ((1 - t)**3) * p1 + 3*((1-t)**2 * t) * p2 + 3*((1-t)*t**2) * p3 + (t**3)*p4
        x, y = coords.tolist()
        points.append([x, y])

    for t in np.linspace(0.01, 1.0, num=20).tolist():
        x = (1-t) * 2 * 0 + 2*(1-t)*t*0.5 + t**2 * 1
        y = (1-t) * 2 * 0 + 2*(1-t)*t*1 + t**2 * 0
        p1 = np.array([0.0, 0.0]) * thickness
        p2 = np.array([1.2, 0.5]) * thickness
        p3 = np.array([1.0, 0.12]) * thickness
        p4 = np.array([1.0, 1.0]) * thickness
        coords = ((1 - t)**3) * p1 + 3*((1-t)**2 * t) * p2 + 3*((1-t)*t**2) * p3 + (t**3)*p4
        x, y = coords.tolist()
        points.append([x, y])
    path = []
    for idx in range(len(points)):
        path.append(idx)

    arc_shape = Polygon(points=points, paths=[path])
    #arc_shape = Circle(r = 1, fn=42)
    donut = arc_shape.translate([-length,0,0]).rotate_extrude(convexity = 40)
    cube_size = 200
    #arc = donut - Cube(cube_size, center=True).translate([-cube_size/2, 0, 0])
    arc = donut.rotate(rot)
    arc = arc.scale([.5,1,1])
    return arc


def transform(shape, transformations):
    if any(isinstance(l, list) for l in transformations):
        for tier in transformations:
            shape = shape.rotate(tier[3:]).translate(tier[0:3])
    else:
        shape = shape.rotate(transformations[3:]).translate(transformations[0:3])
    return shape


def transform_switch(shape, transformations):
    shape = shape.translate([-mount_width/2-1.5, -mount_height/2 -2.5, -plate_thickness/2])
    return transform(shape, transformations)


def make_round(shape):
    IR = 2
    OR = 1
    cube_size = [500, 500, 500]
    cube_size_2 = [500 - .1, 500 - .1, 500 - .1]
    shape = shape.minkowski()
    shape.append(Sphere(IR))
    neg_shape = Cube(cube_size, center=True) - shape
    neg_shape = neg_shape.minkowski()
    neg_shape.append(Sphere(IR + OR))
    pos_shape = Cube(cube_size_2, center=True) - neg_shape
    pos_shape = pos_shape.minkowski()
    pos_shape.append(Sphere(OR))
    return pos_shape


def round_edges(shape, xy_radius=5, z_curve=5, z_radius=1):
    shape = shape.minkowski()
    # Round x and y corners
    shape.append(Cylinder(r=xy_radius, h=.001))
    # Round z edges
    shape.append(Sphere(r=z_radius, fn=z_curve))
    return shape


def apply_rows_ergo_main(plate):
    # left to right are columns 0 and up, bottom to up are rows 0 and up
    # TODO: Make this dynamically adjust to the number of rows
    # TODO: Find formula for the curvature angle and xyz shift compensation
    v_curve = 36  # Amount of vertical curvature
    middle_height = -v_curve/plate.columns
    #                         x   y              z            x_rot    y_rot  z_rot
    plate.row_modifiers[0] = [0,  0,            -2,   -v_curve + 10,   0,     0]
    plate.row_modifiers[1] = [0,  0, middle_height,             0,   0,     0]
    plate.row_modifiers[2] = [0,  0,             0,         v_curve,   0,     0]
    return plate


def apply_columns_ergo_main(plate):
    X_MOV = 0
    Y_MOV = 1
    Z_MOV = 2
    X_ROT = 3
    Y_ROT = 4
    Z_ROT = 5

    # Shift columns back towards the base of the hand
    plate.cm[INDEX_SIDE][Y_MOV] += -.4
    plate.cm[INDEX][Y_MOV]      += -3
    plate.cm[MIDDLE][Y_MOV]     += -3
    plate.cm[RING][Y_MOV]       += -8
    plate.cm[PINKY][Y_MOV]      += -19

    # Apply horizontal curvature
    h_curve = 2
    plate.cm[INDEX_SIDE][Y_ROT] += h_curve
    plate.cm[INDEX][Y_ROT]      += h_curve
    plate.cm[MIDDLE][Y_ROT]     += 0
    plate.cm[RING][Y_ROT]       += -h_curve * 1.2
    plate.cm[PINKY][Y_ROT]      += -h_curve

    # Compensate mount heights for the horizontal curvature
    plate.cm[INDEX_SIDE][Z_MOV] += -h_curve * .05
    plate.cm[INDEX][Z_MOV]      += -h_curve * .4
    plate.cm[MIDDLE][Z_MOV]     += -h_curve * .6
    plate.cm[RING][Z_MOV]       += -h_curve * .4
    plate.cm[PINKY][Z_MOV]      += h_curve * .05

    # Get rid of x shift to the right in the center row because of the horizontal curvature
    # Shifting the entire row does not compensate in the way we want, so we apply the shifting
    # to individual mounts instead, except for the middle finger one.
    # plate.im[center_row][INDEX_SIDE][X_MOV] -= h_curve / 3.6  # Compensate index_side inward rotation
    plate.im[BOTTOM_ROW][INDEX_SIDE][X_MOV] -= h_curve / 10
    plate.im[CENTER_ROW][INDEX][X_MOV] -= h_curve / 10
    plate.im[CENTER_ROW][RING][X_MOV] += h_curve / 10
    plate.im[CENTER_ROW][PINKY][X_MOV] += h_curve / 10

    # Create column cavities to account for different finger lengths
    plate.cm[INDEX_SIDE][Z_MOV] += -3
    plate.cm[INDEX][Z_MOV]      += -3
    plate.cm[MIDDLE][Z_MOV]     += -8
    plate.cm[RING][Z_MOV]       += -6
    plate.cm[PINKY][Z_MOV]      += -4

    # Shift the pinky finger column away from the other columns
    plate.cm[PINKY][X_MOV]      += .4

    # Shift index side column towards the index
    plate.cm[INDEX_SIDE][X_MOV]      += 1.4


    # Variable arc length for each finger
    modifiers = [[list(map(sum, zip(plate.rm[row], plate.cm[column], plate.im[row][column]))) for column in range(plate.columns)] for row in range(plate.rows)]
    modifiers = [[modifiers[row][column] + [plate.ik[row][column]] for column in range(plate.columns)] for row in range(plate.rows)]

    plate.generate()
    switch_matrix = []
    for row in range(plate.rows):
        switch_row = []
        for column in range(plate.columns):
            # Make the arc length longer for longer fingers
            row_spacing = plate.row_spacing
            if column == INDEX_SIDE:
                row_spacing -= 2.6
            if column == MIDDLE:
                row_spacing += 2.0
            if column == RING:
                row_spacing += 0.8
            if column == PINKY:
                row_spacing -= 2.6
            switch = Keyswitch_mount([list(map(sum, zip(modifiers[row][column][:3], [column * (plate.mount_width + plate.column_spacing), row * (plate.mount_length + row_spacing), 0]))) + modifiers[row][column][3:6], [plate.origin[0], plate.origin[1], plate.origin[2], plate.x_tent, plate.y_tent, plate.z_tent]], modifiers[row][column][6], plate.switch_type, plate.mount_length, plate.mount_width, plate.mx_notches)
            switch_row.append(switch)
        switch_matrix.append(switch_row)
    plate.sm = plate.switch_matrix = switch_matrix

    return plate


def apply_walls_main(plate):
    # Re-generate the hulls to account for the extended arcs
    plate.row_hulls = [[(plate.sm[row][column].get_front(plate.row_hull_thickness, plate.row_hull_extrude) + plate.sm[row+1][column].get_back(plate.row_hull_thickness, plate.row_hull_extrude)).hull() for column in range(plate.columns)] for row in range(plate.rows-1)]
    plate.column_hulls = [[(plate.sm[row][column].get_right(plate.col_hull_thickness, plate.col_hull_extrude) + plate.sm[row][column+1].get_left(plate.col_hull_thickness, plate.col_hull_extrude)).hull() for column in range(plate.columns - 1)] for row in range(plate.rows)]
    plate.corner_hulls = [[(plate.sm[row][column].get_corner("fr", plate.ch_thickness, plate.ch_thickness)
                        + plate.sm[row][column+1].get_corner("fl", plate.ch_thickness, plate.ch_thickness)
                        + plate.sm[row+1][column].get_corner("br", plate.ch_thickness, plate.ch_thickness)
                        + plate.sm[row+1][column+1].get_corner("bl", plate.ch_thickness, plate.ch_thickness)).hull() for column in range(plate.columns-1)] for row in range(plate.rows-1)]

    # plate.right_wall = [project(plate.sm[row][plate.columns-1].get_right(plate.side_wall_thickness, plate.side_extrude)) for row in range(plate.rows)]
    # plate.right_wall_hulls = [project((plate.sm[row][plate.columns-1].get_corner("fr", plate.side_wall_thickness, plate.wall_y, plate.side_extrude)
    #                     + plate.sm[row+1][plate.columns-1].get_corner("br", plate.side_wall_thickness, plate.wall_y, plate.side_extrude)).hull()) for row in range(plate.rows - 1)]
    #plate.front_right_corner = project(plate.sm[plate.rows-1][plate.columns-1].get_corner("fr", plate.side_extrude, plate.wall_extrude, plate.side_extrude, plate.wall_extrude))
    plate.back_right_corner = []
    plate.back_left_corner = []
    plate.front_right_corner = []
    plate.front_left_corner = []

    plate.right_wall = [[] for row in range(plate.rows)]
    plate.left_wall = [[] for row in range(plate.rows)]
    plate.right_wall_hulls = [[] for row in range(plate.rows)]
    plate.left_wall_hulls = [[] for row in range(plate.rows)]
    plate.front_wall = [[] for column in range(plate.columns)]
    plate.front_wall_hulls  = [[] for column in range(plate.columns - 1)]
    plate.back_wall = [[] for column in range(plate.columns)]
    plate.back_wall_hulls  = [[] for column in range(plate.columns - 1)]

    # left_wall = []
    # for row in range(plate.rows):
    #     piece = plate.sm[row][0].get_left(plate.side_wall_thickness, plate.side_extrude).turn_on_debug()
    #     left_wall.append(piece)

    # plate.left_wall = left_wall
    # left_wall_hulls = []
    # for row in range(plate.rows - 1):
    #     fl_corner = plate.sm[row][0].get_corner("fl",
    #                                             plate.side_wall_thickness,
    #                                             plate.wall_y,
    #                                             plate.side_extrude)
    #     bl_corner = plate.sm[row+1][0].get_corner("bl",
    #                                               plate.side_wall_thickness,
    #                                               plate.wall_y,
    #                                               plate.side_extrude)
    #     left_wall_hulls.append((fl_corner + bl_corner).hull().turn_on_debug())
    #     #left_wall_hulls.append(fl_corner + bl_corner)
    # plate.left_wall_hulls = left_wall_hulls

    # front_wall = []
    # for column in range(plate.columns):
    #     piece = plate.sm[plate.rows - 1][column].get_front(plate.side_wall_thickness, plate.side_extrude).turn_on_debug()
    #     front_wall.append(piece)

    # plate.front_wall = front_wall

    # Remove front walls from main matrix to curve them manually
    # plate.front_wall = [[] for column in range(plate.columns)]
    # front_wall_hulls = []
    # for column in range(plate.columns - 1):
    #     fr_corner = plate.sm[plate.rows - 1][column].get_corner("fr",
    #                                                             plate.wall_x,
    #                                                             plate.side_wall_thickness,
    #                                                             0,
    #                                                             plate.side_extrude)
    #     fl_corner = plate.sm[plate.rows - 1][column+1].get_corner("fl",
    #                                                               plate.wall_x,
    #                                                               plate.side_wall_thickness,
    #                                                               0,
    #                                                               plate.side_extrude)
    #     front_wall_hulls.append((fr_corner + fl_corner).hull().turn_on_debug())
    # plate.front_wall_hulls = front_wall_hulls
    # # Remove generated front hulls
    # plate.front_wall_hulls  = [[] for column in range(plate.columns - 1)]


    # back_wall = []
    # for column in range(plate.columns):
    #     piece = plate.sm[0][column].get_back(plate.side_wall_thickness, plate.side_extrude).turn_on_debug()
    #     back_wall.append(piece)

    # plate.back_wall = back_wall
    # # Remove generated back wall
    # plate.back_wall = [[] for column in range(plate.columns)]
    # back_wall_hulls = []
    # for column in range(plate.columns - 1):
    #     br_corner = plate.sm[0][column].get_corner("br",
    #                                                plate.wall_x,
    #                                                plate.side_wall_thickness,
    #                                                0,
    #                                                plate.side_extrude)
    #     bl_corner = plate.sm[0][column+1].get_corner("bl",
    #                                                  plate.wall_x,
    #                                                  plate.side_wall_thickness,
    #                                                  0,
    #                                                  plate.side_extrude)
    #     back_wall_hulls.append((br_corner + bl_corner).hull().turn_on_debug())
    # plate.back_wall_hulls = back_wall_hulls
    # # Remove generated hulls back hulls
    # plate.back_wall_hulls  = [[] for column in range(plate.columns - 1)]


    #plate.front_left_corner = plate.sm[plate.rows-1][0].get_corner("fl", plate.side_extrude, plate.side_extrude, plate.side_extrude, plate.side_extrude).turn_on_debug()
    #plate.back_left_corner = plate.sm[0][0].get_corner("bl", plate.side_extrude, plate.side_extrude, plate.side_extrude, plate.side_extrude).turn_on_debug()

    return plate


def generate_main_plate():
    num_rows = 3
    num_columns = 5
    plate = Keyboard_matrix(num_rows,
                            num_columns,
                            row_spacing=7.8,
                            column_spacing=2.5,
                            plate_thickness=plate_thickness,
                            origin=[0, 0, 96],
                            x_tent=0,
                            y_tent=57,
                            z_tent=-10,
                            mount_length=DSA_KEY_WIDTH,
                            mount_width=mount_width,
                            switch_type="mx",
                            mx_notches=False)
    plate.side_wall_thickness = plate_thickness
    plate.side_extrude = 3
    plate = apply_rows_ergo_main(plate)
    plate = apply_columns_ergo_main(plate)
    plate = apply_walls_main(plate)
    return plate


def generate_thumb_cluster(plate):
    thumb_origin = list(map(sum, zip(plate.switch_matrix[0][0].transformations[0][0:3], [-31, -32, 28])))

    thumb = Keyboard_matrix(1,
                            5,
                            row_spacing=3.1,
                            column_spacing=4.4,
                            plate_thickness=plate_thickness,
                            origin=thumb_origin,
                            x_tent=-1,
                            y_tent=-52,
                            z_tent=6,
                            mount_length=DSA_KEY_WIDTH,
                            mount_width=mount_width,
                            switch_type="mx",
                            mx_notches=False)
    plate.side_wall_thickness = 1
    h_curve = 36
    thumb.cm[0] = [ 17, -34,   h_curve * 1.14,  -22,  h_curve * 2.7,  -20]
    thumb.cm[1] = [ -1,  -18,   h_curve * .52,  7,  h_curve * 1.6,  8]
    thumb.cm[2] = [  0,   0,   h_curve * .16,  0,              0,  0]
    thumb.cm[3] = [  1,  -21,   h_curve * .52,  7, -h_curve * 1.6,  -8]
    thumb.cm[4] = [-20, -34,   h_curve * 1.2,  -26, -h_curve * 2.95,  23]  # Top key



    #v_curve = 0
    #thumb.rm[0] = [0, 0, 0, -v_curve, 0, 0]

    #thumb.rm[1] = [0, 0, -v_curve/5,  0, 0, 0]
    #thumb.rm[2] = [0, 0, 0,  v_curve, 0, 0]

    #thumb.ignore_keys[2][2] = True
    #thumb.ignore_keys[0][2] = True
    #thumb.ignore_keys[0][1] = True
    thumb.generate()
    thumb.right_wall = [[] for row in range(thumb.rows)]
    thumb.right_wall_hulls = [[] for row in range(thumb.rows)]
    #thumb.left_wall[0] = []
    #thumb.left_wall[1] = []
    #thumb.left_wall[2] = []
    #thumb.left_wall_hulls[0] = []
    #thumb.left_wall_hulls[1] = []
    left_wall_hulls = []
    for row in range(thumb.rows - 1):
        fl_corner = thumb.sm[row][0].get_corner("fl",
                                                thumb.side_wall_thickness,
                                                thumb.wall_y,
                                                thumb.side_extrude)
        bl_corner = thumb.sm[row+1][0].get_corner("bl",
                                                  thumb.side_wall_thickness,
                                                  thumb.wall_y,
                                                  thumb.side_extrude)
        left_wall_hulls.append((fl_corner + bl_corner).hull().turn_on_debug())
        #left_wall_hulls.append(fl_corner + bl_corner)
    thumb.left_wall_hulls = left_wall_hulls
    thumb.left_wall_hulls = [[] for row in range(thumb.rows)]
    thumb.left_wall = [[] for row in range(thumb.rows)]




    # Remove corners and walls
    thumb.back_wall = [[] for col in range(thumb.columns)]
    thumb.back_wall_hulls = [[] for col in range(thumb.columns)]
    thumb.back_right_corner = []
    thumb.back_right_corner_hulls = []
    back_wall_hulls = []
    # Complete the gap that gets left from removing the corners
    for column in range(thumb.columns - 1):
        br_corner = thumb.sm[0][column].get_corner("br",
                                                   thumb.wall_x,
                                                   thumb.side_wall_thickness,
                                                   0,
                                                   thumb.side_extrude)
        bl_corner = thumb.sm[0][column+1].get_corner("bl",
                                                     thumb.wall_x,
                                                     thumb.side_wall_thickness,
                                                     0,
                                                     thumb.side_extrude)
        back_wall_hulls.append((br_corner + bl_corner).hull().turn_on_debug())
    thumb.back_wall_hulls = back_wall_hulls
    thumb.back_wall_hulls = [[] for col in range(thumb.columns - 1)]


    thumb.front_wall[2] = []
    thumb.front_wall[1] = []
    thumb.front_wall[0] = []
    front_wall_hulls = []
    for column in range(thumb.columns - 1):
        fr_corner = thumb.sm[thumb.rows - 1][column].get_corner("fr",
                                                                thumb.wall_x,
                                                                thumb.side_wall_thickness,
                                                                0,
                                                                thumb.side_extrude)
        fl_corner = thumb.sm[thumb.rows - 1][column+1].get_corner("fl",
                                                                  thumb.wall_x,
                                                                  thumb.side_wall_thickness,
                                                                  0,
                                                                  thumb.side_extrude)
        front_wall_hulls.append((fr_corner + fl_corner).hull().turn_on_debug())
    thumb.front_wall_hulls = front_wall_hulls
    thumb.front_wall_hulls = [[] for col in range(thumb.columns - 1)]


    thumb.front_right_corner = thumb.sm[thumb.rows-1][2].get_corner("fr", thumb.side_extrude, thumb.side_extrude, thumb.side_extrude, thumb.side_extrude).turn_on_debug()
    thumb.front_right_corner = []
    thumb.front_right_corner_hulls = []

    thumb.front_left_corner = []

    front_wall = []
    for column in range(thumb.columns):
        piece = thumb.sm[thumb.rows - 1][column].get_front(thumb.side_wall_thickness, thumb.side_extrude)
        front_wall.append(piece)
    thumb.front_wall = front_wall
    thumb.front_wall = [[] for col in range(thumb.columns)]

    #thumb.left_wall[2] = thumb.sm[2][0].get_left(3, 3)
    #thumb.left_wall[1] = thumb.sm[1][0].get_left(3, 3)
    #thumb.front_left_corner = thumb.sm[thumb.rows-1][0].get_corner("fl", thumb.side_extrude, thumb.side_extrude, thumb.side_extrude, thumb.side_extrude).turn_on_debug()
    return thumb


def interpolate_cuadratic_bezier(point_a, point_b, control_point, segments=10):
    point_a = np.array(point_a)
    point_b = np.array(point_b)
    control_point = np.array(control_point)

    curve_points = []
    for seg in range(segments): 
        t = seg / segments
        curve_point = ((1-t)**2 * point_a + 2*(1-t)*t*control_point + t**2 * point_b)
        curve_points.append(curve_point.tolist())
    return curve_points


def interpolate_cubic_bezier(start, end, bezier_1, bezier_2, segments=10):
    start = np.array(start) # 0
    end = np.array(end) # 3
    bezier_1 = np.array(bezier_1) # 1
    bezier_2 = np.array(bezier_2)  # 2 

    curve_points = []
    # Include the end vector as the last segment
    segments -= 1
    for seg in range(segments): 
        t = seg / segments
        curve_point = ((1-t)**3 * start + 3*(1-t)**2 * t * bezier_1 + 3*(1-t)*t**2 * bezier_2 + t**3*end)
        curve_points.append(curve_point.tolist())
    curve_points.append(end.tolist())
    return curve_points


def get_corner_pos(radius, height, key_mount, corner_type, origin=[0,0,0]):
        corner_map = {"bl":[-1,-1,-1],
                      "br":[1,-1,-1],
                      "tl":[-1,1,-1],
                      "tr":[1,1,-1],
                      "fl":[-1,1,-1],
                      "fr":[1,1,-1]}
        shift_magnitudes = [key_mount.mount_width/2 + radius,
                            key_mount.mount_length/2 + radius,
                            0]
        rel_corner_pos = [m * sig for m, sig in zip(shift_magnitudes, corner_map[corner_type])]
        rel_corner_pos = (np.array(rel_corner_pos) + np.array(origin)).tolist()
        abs_corner_pos = get_coordinates(key_mount.transformations, rel_corner_pos)
        return abs_corner_pos


def mount_corner(radius, height, key_mount, corner_type, shape, detail, x_offset=0, y_offset=0, z_offset=0):
        if shape == "cylinder":
            corner = Cylinder(r=radius, h=height, center=True, _fn=detail)
        elif shape == "cube":
            corner = Cube([radius * 2, radius * 2, height], center=True)
        elif shape == "cyli_cube_1":
            cube = Cube([radius * 2, radius, height], center=True)
            cube = cube.translate([0, -radius/2, 0]) + cube.translate([-radius, radius/2, 0])
            cylinder = Cylinder(r=radius, h=height, center=True, _fn=detail)
            corner = cube + cylinder
        elif shape == "cyli_cube_2":
            cube = Cube([radius * 2, radius, height], center=True)
            cube = cube.translate([0, -radius/2, 0]) #+ cube.translate([-radius/2, 0, 0])
            cylinder = Cylinder(r=radius, h=height, center=True, _fn=detail)
            corner = cube + cylinder
        elif shape == "cyli_cube_3":
            cube = Cube([radius * 2, radius, height], center=True)
            cube = cube.translate([0, radius/2, 0]) #+ cube.translate([-radius/2, 0, 0])
            cylinder = Cylinder(r=radius, h=height, center=True, _fn=detail)
            corner = cube + cylinder
        # Middle to Ring long shifted side. 
        elif shape == "cyli_cube_4":
            cube = Cube([radius * 2, radius, height], center=True)
            cube = cube.translate([0, -radius/2, 0]) + cube.translate([radius, radius/2, 0])
            cyl2 = Cylinder(r=radius, h=height, center=True, _fn=detail).translate([radius * 6.461, 0, 0])
            cylinder = Cylinder(r=radius, h=height, center=True, _fn=detail)
            corner = cube + cylinder + cyl2
        # Middle to Pinky long shifted side. 
        elif shape == "cyli_cube_5":
            cube = Cube([radius * 2, radius, height], center=True)
            cube = cube.translate([0, -radius/2, 0]) #+ cube.translate([-radius/2, 0, 0])
            cylinder = Cylinder(r=radius, h=height, center=True, _fn=detail)
            cyl2 = Cylinder(r=radius, h=height, center=True, _fn=detail).translate([radius * 6.461, 0, 0])
            corner = cube + cylinder + cyl2
        # Middle finger to index shifted side. 
        elif shape == "cyli_cube_6":
            cube = Cube([radius * 2, radius, height], center=True)
            cube = cube.translate([0, radius/2, 0]) #+ cube.translate([-radius/2, 0, 0])
            cylinder = Cylinder(r=radius, h=height, center=True, _fn=detail)
            cyl2 = Cylinder(r=radius, h=height, center=True, _fn=detail).translate([-radius * 4.73, 0, 0])
            corner = cube + cylinder + cyl2
        
        corner_map = {"bl":[-1,-1,-1],
                      "br":[1,-1,-1],
                      "tl":[-1,1,-1],
                      "tr":[1,1,-1],
                      "fl":[-1,1,-1],
                      "fr":[1,1,-1]}
        shift_magnitudes = [key_mount.mount_width/2 + radius,
                            key_mount.mount_length/2 + radius,
                            0]
        rotation_angles = get_rotation_angles(key_mount.transformations)
        corner = corner.rotate(rotation_angles)
        #translate_vec = [m * sig for m, sig in zip(shift_magnitudes, corner_map[corner_type])]
        origin = [x_offset, y_offset, z_offset]
        translate_vec = get_corner_pos(radius, height, key_mount, corner_type, origin)
        corner = corner.translate(translate_vec)
        #corner = key_mount.transform(corner)
        return corner


def get_middle_point(point_a, point_b, key_mount, offset=[0,0,0]):
    rel_middle = np.array(point_a) / np.array(point_b)
    rel_middle = (rel_middle + np.array(offset)).tolist()
    abs_middle = get_coordinates(key_mount.transformations, rel_middle)
    return abs_middle


def linear_interpolate(vector_a, vector_b, steps, deadband_percentage=10):
    # deadband_percentage indicates the beginning and end portions of the total steps that will be ignored 
    # for the interpolation. Nothing will be interpolated in the first and last `deadband_percentage`.
    # For example, interpolating from 0 to 9 in 14 steps with 10% deadband would
    # yield:  
    #   10%       80%       10%
    # |-----|-------------|-----|
    # 0                         9 
    # 0 0 0 1 2 3 4 5 6 7 8 9 9 9
    # 
    vector_a = np.array(vector_a)
    vector_b = np.array(vector_b)
    interpolated_steps = int(steps - steps * (deadband_percentage * 2)/100)
    start_deadband = int((steps - interpolated_steps) / 2)
    end_deadband = steps - interpolated_steps - start_deadband

    delta = (vector_b - vector_a).astype("float64")
    step = delta / np.array(interpolated_steps, dtype="float64")

    print(vector_a)
    print(vector_b, "\n")
    print(start_deadband, interpolated_steps, end_deadband)

    trajectory = [vector_a for _ in range(start_deadband)]
    intermediate = vector_a.copy().astype("float64")
    for _ in range(interpolated_steps):
        intermediate += step
        trajectory.append(intermediate.copy())
    trajectory.extend([vector_b for _ in range(end_deadband)])
    print(trajectory)

    return trajectory


def generate_back(plate, draft_version=True, outline_size=4):
    thickness = 2
    if draft_version:
        detail = 36
        interpolation_segments = 62
        make_top_hull = True
    else:
        detail = 186
        interpolation_segments = 248
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
    def make_top_cap(radius):
        top_cap_r = radius
        top_bevel, top_height, top_radius = top_double_bevel(initial_radius=radius, 
                                                             first_length=.6, 
                                                             first_angle=32, 
                                                             second_length=8, 
                                                             second_angle=50)
        
        top_bevel = top_bevel.translate([-20.5, -1, -13.56 - outline_size])
        top_center_key = plate.sm[CENTER_ROW][INDEX_SIDE]
        top_bevel = top_center_key.transform(top_bevel.rotate([0,90,0]))
        top_bevel = top_bevel - top_bevel.translate([thickness,0,-thickness]) 
        # Remove one corner of the top bevel
        cube = Cube(50).translate([-20,0,0])
        cube = cube.rotate([36, 0,0])
        cube = cube.translate([-top_height-outline_size, top_radius + 6.07, 0])
        cube = top_center_key.transform(cube).color([.5,.3,.3])
        # Remove the other corner of the top bevel
        cube2 = Cube(50).translate([-20,0,0])
        cube2 = cube2.rotate([65, 0,0])
        cube2 = cube2.translate([-top_height-outline_size, -top_radius - 1, 0])
        cube2 = top_center_key.transform(cube2).color([.5,.2,.3])
        # Remove center fill
        cylinder = Cylinder(r=top_cap_r + 11, h=40).translate([-58, -3,-30])
        cylinder = cylinder.rotate([0, 90, 0])
        cylinder = top_center_key.transform(cylinder).color([.2,.3,.3])
        

        
        bottom_key = plate.sm[BOTTOM_ROW][INDEX_SIDE]
        top_key = plate.sm[TOP_ROW][INDEX_SIDE]
        point_a = get_corner_pos(radius=4, 
                                 height=3, 
                                 key_mount=bottom_key, 
                                 corner_type="bl")
        point_b = get_corner_pos(radius=4, 
                                 height=3, 
                                 key_mount=top_key, 
                                 corner_type="tl")
        bezier_a_offset = [0,25,-40]
        bezier_b_offset = [0,-25,-40]
        bezier_a = get_corner_pos(radius=4, 
                                 height=3, 
                                 key_mount=bottom_key, 
                                 corner_type="bl",
                                 origin=bezier_a_offset)
        bezier_b = get_corner_pos(radius=4, 
                                 height=3, 
                                 key_mount=top_key, 
                                 corner_type="tl",
                                 origin=bezier_b_offset)
        trajectory = interpolate_cubic_bezier(start=point_a, 
                                          end=point_b, 
                                          bezier_1=bezier_a, 
                                          bezier_2=bezier_b, 
                                          segments=interpolation_segments)
        rotation_a = np.array(get_rotation_angles(bottom_key.transformations))
        rotation_b = np.array(get_rotation_angles(top_key.transformations))
        key_corners = []
        for row in range(plate.rows):
            if row == 0 or row == plate.rows - 1:
                shape = "cylinder"
            else:
                shape = "cube"
            corner = mount_corner(radius=4, 
                                  height=3, 
                                  key_mount=plate.sm[row][INDEX_SIDE], 
                                  corner_type="bl",
                                  shape=shape,
                                  detail=detail)
            key_corners.append(corner)
            corner = mount_corner(radius=4, 
                                  height=3, 
                                  key_mount=plate.sm[row][INDEX_SIDE], 
                                  corner_type="tl",
                                  shape=shape,
                                  detail=detail)
            key_corners.append(corner)
        rotation_delta = rotation_b - rotation_a
        rotation_increment = rotation_delta / (len(trajectory) - 1)
        current_rotation = rotation_a
        final_curve = None
        prev_piece = None
        for idx, point in enumerate(trajectory):
            rel_pos = ((np.array(point) - np.array(point_a))).tolist()
            cyl_r = 4
            cyl_h = 3
            cylinder = Cylinder(r=cyl_r, h=cyl_h, center=True, _fn=detail).color([.2,.3,.4])
            cube = Cube([cyl_r , cyl_r* 2, cyl_h], center=True)
            cube = cube.translate([cyl_r/2, 0, 0])
            cyli_cube = cylinder + cube
            
            if idx < (len(trajectory) / 38) or idx > (len(trajectory) * (37 / 38)):
                step_shape = cyli_cube
            else:
                cube_size = cyl_r * 2
                bevel_cut = Cube([cube_size, cube_size, cyl_h*2])
                bevel_cut = bevel_cut.translate([-cube_size/2, -cube_size/2, -cube_size]).rotate([0,45,0])
                step_shape = cyli_cube - bevel_cut
            step_shape = step_shape.rotate(current_rotation.tolist()).translate(point)
            current_rotation += rotation_increment
            
            if make_top_hull:
                progress = idx / len(trajectory)
                corner_idx = int(progress * len(key_corners))
                current_corners = key_corners[corner_idx]
                if idx == 0 or idx == len(trajectory) - 1:
                    prev_piece = current_corners
                else:
                    temp = current_corners
                    current_corners += prev_piece
                    prev_piece = (temp + step_shape)
                step_shape = (current_corners + step_shape).color([.2,.7,.5]).hull()
                
            if not final_curve:
                final_curve = step_shape
            else:
                final_curve += step_shape
        return final_curve

    def make_back_arc(radius, column_idx, shape, size_x, size_y, height, offset=[0,0,0]):        
        bottom_key = plate.sm[BOTTOM_ROW][column_idx]
        top_key = plate.sm[TOP_ROW][column_idx]
        point_a = get_corner_pos(radius=size_x/2, 
                                 height=height, 
                                 key_mount=bottom_key, 
                                 corner_type="bl",
                                 origin=[0,-size_x/2, -size_x/2 + 1])
        point_b = get_corner_pos(radius=size_x/2, 
                                 height=height, 
                                 key_mount=top_key, 
                                 corner_type="tl",
                                 origin=[0,size_x/2, -size_x/2 + 1])
        bezier_a_offset = [0,25,-40]
        bezier_b_offset = [0,-25,-40]
        bezier_a = get_corner_pos(radius=size_x/2, 
                                 height=height, 
                                 key_mount=bottom_key, 
                                 corner_type="bl",
                                 origin=bezier_a_offset)
        bezier_b = get_corner_pos(radius=size_x/2, 
                                 height=height, 
                                 key_mount=top_key, 
                                 corner_type="tl",
                                 origin=bezier_b_offset)
        translation_trajectory = interpolate_cubic_bezier(start=point_a, 
                                          end=point_b, 
                                          bezier_1=bezier_a, 
                                          bezier_2=bezier_b, 
                                          segments=interpolation_segments)
        rotation_a = np.array(get_rotation_angles(bottom_key.transformations))
        rotation_b = np.array([180, 0, 0]) + np.array(get_rotation_angles(top_key.transformations))
        rotation_trajectory = linear_interpolate(rotation_a, rotation_b, interpolation_segments, deadband_percentage=10)

        final_curve = None
        prev_shape = None
        for point, rotation in zip(translation_trajectory, rotation_trajectory):
            rel_pos = ((np.array(point) - np.array(point_a))).tolist()
            if shape == "cube": 
                step_shape = Cube([size_x, size_y, height], center=True)
            else:
                step_shape = Cylinder(r=size_x/2, h=height, center=True, _fn=detail).color([.2,.3,.4])
            step_shape = step_shape.rotate(rotation.tolist()).translate(point).translate(offset)

            if prev_shape:
                # segment = (prev_shape + step_shape).hull()
                segment = step_shape
            else:
                segment = step_shape
            prev_shape = step_shape 

            if not final_curve:
                final_curve = segment
            else:
                final_curve += segment
        return final_curve
    top_cap = make_back_arc(radius=38, column_idx=INDEX, shape="cube", size_x=8, size_y=1, height=3)

    #top_bevel = remove_corners(top_bevel, x_offset=0)
    #top_bevel = remove_corners(top_bevel, x_offset=.1)
    #return top_bevel - (cube + cube2 + cylinder)
    #top_bevel = top_bevel - (cube + cube2)
    return top_cap


def generate_plate_outline(plate, draft_version=True):
    if draft_version:
        detail = 30
    else:
        detail = 146

    def make_curve_points(current_key, next_key, segments, middle_delta, 
                          corner_radius, corner_height, corner_pos, 
                          start_offset=[0,0,0], end_offset=[0,0,0]):
        corner1_pos = get_corner_pos(
            corner_radius, 
            corner_height, 
            current_key,
            corner_pos)
        corner2_pos = get_corner_pos(
            corner_radius, 
            corner_height, 
            next_key, 
            corner_pos)
        point_a = np.array(corner1_pos) + np.array(start_offset)
        point_b = np.array(corner2_pos) + np.array(end_offset)

        middle_point = np.array(get_middle_point(
            point_a=point_a, 
            point_b=point_b, 
            key_mount=current_key, 
            offset=middle_delta)
        )
        trajectory = interpolate_cuadratic_bezier(
            point_a=point_a, 
            point_b=point_b, 
            control_point=middle_point, 
            segments=segments
        )
        
        rotation_angles = get_rotation_angles(current_key.transformations)
        curve_pieces = []
        for point in trajectory:
            cylinder = Cylinder(r=corner_radius, 
                                h=corner_height, 
                                center=True, 
                                _fn=detail)
            cylinder = cylinder.rotate(rotation_angles)
            cylinder = cylinder.translate(point)
            curve_pieces.append(cylinder)
        return sum_shapes(curve_pieces)
    
    def rounded_horizontal_side(side, corner_radius, corner_height, x_offset=0, y_offset=0, z_offset=0, is_cut=False):
        if side == "left":
            col_idx = INDEX_SIDE
            corner_pos = "l"
        elif side == "right":
            col_idx = PINKY
            corner_pos = "r"

        edge_list = []
        prev_corner = None
        for row_idx in range(plate.rows):
            # Only round first and last corners.
            if row_idx == 0:
                shape="cylinder"
                if is_cut and side == "left":
                    y_offset = .17
                elif is_cut and side == "right":
                    y_offset = 1.17
            else:
                shape="cube"

            if row_idx == (plate.rows - 1):
                if is_cut and side == "left":
                    y_offset = -.17
                    x_offset = .18
                elif is_cut and side == "right":
                    y_offset = -.17
           
            corner1 = mount_corner(radius=corner_radius, 
                                   height=corner_height, 
                                   key_mount=plate.sm[row_idx][col_idx], 
                                   corner_type="b" + corner_pos,
                                   shape=shape,
                                   detail=detail,
                                   x_offset=x_offset, 
                                   y_offset=y_offset, 
                                   z_offset=z_offset)
            if row_idx == (plate.rows - 1):
                shape="cylinder"
            else:
                shape="cube"
            corner2 = mount_corner(radius=corner_radius, 
                                   height=corner_height, 
                                   key_mount=plate.sm[row_idx][col_idx], 
                                   corner_type="t" + corner_pos,
                                   shape=shape,
                                   detail=detail,
                                   x_offset=x_offset, 
                                   y_offset=y_offset, 
                                   z_offset=z_offset)
            edge_list.append((corner1 + corner2).hull())
            if row_idx != 0 and prev_corner:
                edge_list.append((prev_corner + corner1).hull())
            prev_corner = corner2
        return sum_shapes(edge_list)

    def sculped_vertical_side(side, corner_radius, corner_height, x_offset=0, y_offset=0, z_offset=0):
        if side == "top":
            row_idx = TOP_ROW
            corner_pos = "t"
        elif side == "bottom":
            row_idx = BOTTOM_ROW
            corner_pos = "b"

        edge_list = []
        prev_corner = None
        for col_idx in range(plate.columns):
            # Only round first and last corners.
            if col_idx == 0:
                shape="cylinder"
            else:
                shape="cube"
            offset = 0
            if col_idx == RING:
                if side == "top":
                    shape="cyli_cube_2"
                    offset = 7.99
                else:
                    shape = "cyli_cube_3"
                    offset = 0
            elif col_idx == PINKY:
                if side == "bottom":
                    offset = 0
                    shape = "cyli_cube_3"
                else:
                    shape="cyli_cube_2"
                    offset = 7.99
            elif col_idx == MIDDLE:
                if side == "bottom":
                    shape="cyli_cube_3"
                else:
                    shape="cyli_cube_2"
            corner1 = mount_corner(radius=corner_radius, 
                                   height=corner_height, 
                                   key_mount=plate.sm[row_idx][col_idx], 
                                   corner_type=corner_pos + "l",
                                   shape=shape,
                                   detail=detail,
                                   x_offset=offset + x_offset, 
                                   y_offset=y_offset, 
                                   z_offset=z_offset)
            if col_idx == (plate.columns - 1):
                shape="cylinder"
            else:
                shape="cube"
            offset = 0
            if col_idx == INDEX_SIDE:
                offset = -7.99
                #if side == "top":
                    #y_offset += 0.1
            elif col_idx == INDEX:
                if side == "bottom":
                    shape = "cyli_cube_3"
                    #y_offset -= 0.2
                else:
                    shape = "cyli_cube_2"
                offset = -7.99
            elif col_idx == MIDDLE:
                if side == "bottom":
                    offset = -7.99
                    shape = "cyli_cube_6"
                else:
                    shape = "cyli_cube_2"
            elif col_idx == RING:
                if side == "bottom":
                    offset = -7.99
                    shape = "cyli_cube_3"
                else:
                    shape = "cyli_cube_2"
        
            corner2 = mount_corner(radius=corner_radius, 
                                   height=corner_height, 
                                   key_mount=plate.sm[row_idx][col_idx], 
                                   corner_type=corner_pos + "r",
                                   shape=shape,
                                   detail=detail,
                                   x_offset=offset + x_offset,
                                   y_offset=y_offset, 
                                   z_offset=z_offset)
            if draft_version:
                curve_segments = 12
            else:
                curve_segments = 48
            
            if col_idx == PINKY and side == "top":
                # Pinky top left corner to ring top left corner curve.
                current_key = plate.sm[row_idx][col_idx]
                next_key = plate.sm[row_idx][col_idx - 1]
                curved_edge = make_curve_points(current_key, 
                                                next_key,
                                                curve_segments, 
                                                [10.0, 20.0, -3.0],
                                                corner_radius,
                                                corner_height,
                                                corner_pos + "r",
                                                [0,0,0],
                                                [0,.4,0])
                if draft_version:
                    edge_list.append((corner1 + corner2 + curved_edge).hull())
                else:
                    edge_list.append((corner1 + corner2 + curved_edge).hull())
                   
            elif col_idx == RING and side == "top":
                current_key = plate.sm[row_idx][col_idx]
                next_key = plate.sm[row_idx][col_idx - 1]
                curved_edge = make_curve_points(current_key, 
                                                next_key,
                                                curve_segments, 
                                                [10.0, 14.0, -2.0],
                                                corner_radius,
                                                corner_height,
                                                corner_pos + "r",
                                                start_offset=[1,-.3,0],
                                                end_offset=[.35,.1,.2])
                if draft_version:
                    edge_list.append((corner1 + corner2 + curved_edge).hull())
                else:
                    edge_list.append((corner1 + corner2 + curved_edge).hull())
            elif col_idx == RING and side == "bottom":
                current_key = plate.sm[row_idx][col_idx]
                next_key = plate.sm[row_idx][col_idx + 1]
                curved_edge = make_curve_points(current_key, 
                                                next_key,
                                                curve_segments, 
                                                [6.0, -17.0, -1.0],
                                                corner_radius,
                                                corner_height,
                                                corner_pos + "l",
                                                start_offset=[1.1,.1,.2],
                                                end_offset=[.35,.1,.2])
                if draft_version:
                    edge_list.append((corner1 + corner2 + curved_edge).hull())
                else:
                    edge_list.append((corner1 + corner2 + curved_edge).hull())
    
            else:
                edge_list.append((corner1 + corner2).hull())
            if col_idx != 0 and prev_corner:
                edge_list.append((prev_corner + corner1).hull())
            prev_corner = corner2
        return sum_shapes(edge_list)

    def rounded_vertical_side(side, corner_radius, corner_height, x_offset=0, y_offset=0, z_offset=0):
        if side == "top":
            row_idx = TOP_ROW
            corner_pos = "t"
        elif side == "bottom":
            row_idx = BOTTOM_ROW
            corner_pos = "b"

        edge_list = []
        prev_corner = None
        for col_idx in range(plate.columns):
            # Only round first and last corners.
            if col_idx == 0:
                shape="cylinder"
            else:
                shape="cube"
            offset = 0
            if col_idx == RING:
                if side == "top":
                    shape = "cyli_cube_2"
                    offset = -2.99
                else:
                    shape = "cyli_cube_3"
                    offset -= 0.1
            elif col_idx == PINKY:
                if side == "bottom":
                    offset = 0.1
                    shape = "cyli_cube_3"
                else:
                    shape="cyli_cube_2"
                    offset -= 1.3
            elif col_idx == MIDDLE:
                if side == "bottom":
                    shape="cyli_cube_3"
                    offset -= .2
                else:
                    shape="cyli_cube_2"
                    offset = 1.97
            elif col_idx == INDEX:
                offset = 1.8
                if side == "top":
                    y_offset = -.11
                else:
                    y_offset = .17
                    x_offset = 3.17
            elif col_idx == INDEX_SIDE:
                offset = .07
                if side == "top":
                    y_offset = -.17
                    x_offset += .25
                else:
                    y_offset = .17
            corner1 = mount_corner(radius=corner_radius, 
                                   height=corner_height, 
                                   key_mount=plate.sm[row_idx][col_idx], 
                                   corner_type=corner_pos + "l",
                                   shape=shape,
                                   detail=detail,
                                   x_offset=offset + x_offset, 
                                   y_offset=y_offset, 
                                   z_offset=z_offset)
            if col_idx == (plate.columns - 1):
                shape="cylinder"
            else:
                shape="cube"
            offset = 0
            if col_idx == INDEX_SIDE:
                offset = -.99
            elif col_idx == INDEX:
                if side == "bottom":
                    shape = "cylinder"
                    corner_radius += .6 
                    y_offset += .9
                    offset -= 0.7
                else:
                    shape = "cyli_cube_2"
                    offset = .9
            elif col_idx == MIDDLE:
                if side == "bottom":
                    offset -= .99
                    shape = "cyli_cube_3"
                else:
                    offset = -2.15
                    shape = "cyli_cube_2"
            elif col_idx == RING:
                if side == "bottom":
                    offset = 3.99
                    shape = "cyli_cube_3"
                else:
                    offset = -2.4
                    shape = "cyli_cube_2"
            elif col_idx == PINKY:
                if side == "bottom":
                    offset -= 4.5
                    y_offset += .25
                    shape = "cyli_cube_3"
                else:
                    offset = -.32

            corner2 = mount_corner(radius=corner_radius, 
                                   height=corner_height, 
                                   key_mount=plate.sm[row_idx][col_idx], 
                                   corner_type=corner_pos + "r",
                                   shape=shape,
                                   detail=detail,
                                   x_offset=offset + x_offset,
                                   y_offset=y_offset, 
                                   z_offset=z_offset)
            if draft_version:
                curve_segments = 12
            else:
                curve_segments = 48
            
            edge_list.append((corner1 + corner2).hull())
            if col_idx != 0 and prev_corner:
                edge_list.append((prev_corner + corner1).hull())
            prev_corner = corner2
        return sum_shapes(edge_list)
    outer_outline_sides = [
        rounded_horizontal_side(side="left", corner_radius=4, corner_height=6, z_offset=1),
        rounded_horizontal_side(side="right", corner_radius=4, corner_height=6, z_offset=1),
        sculped_vertical_side(side="top", corner_radius=4, corner_height=6, z_offset=1),
        sculped_vertical_side(side="bottom", corner_radius=4, corner_height=6, z_offset=1),
    ]
    outer_outline = sum_shapes(outer_outline_sides)
    inner_outline_sides = [
        rounded_horizontal_side(side="left", corner_radius=.95, corner_height=2, x_offset=.06, z_offset=3.5, is_cut=True),
        rounded_horizontal_side(side="right", corner_radius=.95, corner_height=2, x_offset=-.06, z_offset=3.5, is_cut=True),
        rounded_vertical_side(side="top", corner_radius=.95, corner_height=2, y_offset=-.01, z_offset=3.5),
        rounded_vertical_side(side="bottom", corner_radius=.95, corner_height=2, y_offset=.01, z_offset=3.5),
    ]
    inner_outline = sum_shapes(inner_outline_sides)
    outline = outer_outline - inner_outline.color([.4,.9,.4])
    #return outline.turn_on_debug()
    return outline



def generate_thumb_outline(thumb, draft_version=True):
    if draft_version:
        detail = 36
    else:
        detail = 146

    def rounded_horizontal_side(side, corner_radius, corner_height):
        if side == "left":
            col_idx = 0
            corner_pos = "l"
        elif side == "right":
            col_idx = thumb.columns - 1
            corner_pos = "r"

        edge_list = []
        prev_corner = None
        for row_idx in range(thumb.rows):
            # Only round first and last corners.
            if row_idx == 0:
                shape="cylinder"
            else:
                shape="cube"
            corner1 = mount_corner(radius=corner_radius, 
                                   height=corner_height, 
                                   key_mount=thumb.sm[row_idx][col_idx], 
                                   corner_type="b" + corner_pos,
                                   shape=shape,
                                   detail=detail)
            if row_idx == (thumb.rows - 1):
                shape="cylinder"
            else:
                shape="cube"
            corner2 = mount_corner(radius=corner_radius, 
                                   height=corner_height, 
                                   key_mount=thumb.sm[row_idx][col_idx], 
                                   corner_type="t" + corner_pos,
                                   shape=shape,
                                   detail=detail)
            edge_list.append((corner1 + corner2).hull())
            if row_idx != 0 and prev_corner:
                edge_list.append((prev_corner + corner1).hull())
            prev_corner = corner2
        return edge_list

    def rounded_vertical_side(side, corner_radius, corner_height):
        if side == "top":
            corner_pos = "t"
        elif side == "bottom":
            corner_pos = "b"

        edge_list = []
        prev_corner = None
        for col_idx in range(thumb.columns):
            # Only round first and last corners.
            if col_idx == 0:
                shape="cylinder"
            else:
                shape="cylinder"
            offset = 0
            corner1 = mount_corner(radius=corner_radius, 
                                   height=corner_height, 
                                   key_mount=thumb.sm[0][col_idx], 
                                   corner_type=corner_pos + "l",
                                   shape=shape,
                                   detail=detail,
                                   x_offset=offset)
            if col_idx == (thumb.columns - 1):
                shape="cylinder"
            else:
                shape="cylinder"

            if col_idx == 2:
                if side == "bottom":
                    #offset = -7.99
                    shape = "cyli_cube_3"
            offset = 0
            corner2 = mount_corner(radius=corner_radius, 
                                   height=corner_height, 
                                   key_mount=thumb.sm[0][col_idx], 
                                   corner_type=corner_pos + "r",
                                   shape=shape,
                                   detail=detail,
                                   x_offset=offset)
            edge_list.append((corner1 + corner2).hull())
            
            if col_idx != 0 and prev_corner:
                edge_list.append((prev_corner + corner1).hull())
            prev_corner = corner2
        return edge_list

    edge_list = rounded_vertical_side(side="top", corner_radius=3, corner_height=3)
    edge_list.extend(rounded_vertical_side(side="bottom", corner_radius=3, corner_height=3))
    edge_list.extend(rounded_horizontal_side(side="left", corner_radius=3, corner_height=3))
    edge_list.extend(rounded_horizontal_side(side="right", corner_radius=3, corner_height=3))
    
    return sum_shapes(edge_list).turn_on_debug()


def generate_case(plate, thumb):
    lb_main = plate.sm[BOTTOM_ROW][INDEX_SIDE].get_left(thickness=.1, extrude=plate_thickness)
    trf_thumb = thumb.sm[0][2].get_front(thickness=.1, extrude=plate_thickness)
    #tmr_thumb = thumb.sm[2][1].get_right(thickness=.1, extrude=plate_thickness)
    bl_corner_main = plate.sm[BOTTOM_ROW][INDEX_SIDE].get_corner("bl", 1,1, x_extrude=0, y_extrude=0)

    case_clearance = 11

    # Connect thumb cluster with main plate and leave gap for keys. From plate to thumb
    lb_main_gap = lb_main.translate([-case_clearance, 0, 0])
    case = (lb_main + lb_main_gap).hull()
    case += (lb_main_gap + trf_thumb + bl_corner_main).hull()

    lm_main = plate.sm[CENTER_ROW][INDEX_SIDE].get_left(thickness=.1, extrude=plate_thickness)
    lm_main_gap = lm_main.translate([-case_clearance, 0, 0])
    #tmt_thumb = thumb.sm[2][1].get_front(thickness=.1, extrude=plate_thickness)
    case += (lm_main + lm_main_gap).hull()
    #case += (lm_main_gap + tmr_thumb + lb_main_gap).hull()
    #case += (lm_main_gap + tmt_thumb).hull()
    case += (lm_main_gap + lb_main_gap + plate.left_wall_hulls[0]).hull()


    trr_corner_thumb = thumb.sm[0][2].get_corner("fr", 1, 1, x_extrude=0, y_extrude=0)
    case += (bl_corner_main + trr_corner_thumb).hull()

    #mmr_corner_thumb = thumb.sm[1][1].get_corner("fr", 1, 1, x_extrude=0, y_extrude=0)
    #case += (bl_corner_main + mmr_corner_thumb).hull()

    trr_thumb = thumb.sm[0][2].get_right(thickness=.1, extrude=plate_thickness)
    bi_main = plate.sm[BOTTOM_ROW][INDEX].get_back(thickness=.1, extrude=plate_thickness)
    case += (bi_main + trr_thumb + bi_main + bl_corner_main).hull()

    #lm_main = plate.sm[CENTER_ROW][INDEX_SIDE].get_left(thickness=.1, extrude=plate_thickness)
    #lm_main_gap = lm_main.translate([-case_clearance, 0, 0])
    #case += (lm_main + lm_main_gap).hull()
    #case += (lm_main_gap + tmr_thumb + lb_main_gap).hull()
    return case


def generate_supports(plate, thumb):
    thick = 2
    distance = mount_width + 3
    supports = None
    centers = []
    for column in range(plate.columns):
        row_centers = []
        for row in range(plate.rows - 1, -1, -1):
            if row == BOTTOM_ROW and column == INDEX:
                continue
            elif row == BOTTOM_ROW and column == MIDDLE:
                continue
            if row == BOTTOM_ROW and column == INDEX_SIDE:
                continue
            if row == CENTER_ROW and column == INDEX_SIDE:
                continue
            center = get_coordinates(plate.sm[row][column].transformations)
            if row == TOP_ROW:
                # The curvature of the top row makes the angle too great
                center[1] += distance * .8
            row_centers.append(center)
            start = plate.sm[row][column].get_corner("fl", x=3, y=2, x_extrude=0,
                                                             y_extrude=3, extend=True)
            mid = Cube(3).translate(center).translate([-distance, 0, 0])
            end = plate.sm[row][column].get_corner("bl", x=3, y=2, x_extrude=0,
                                                              y_extrude=3, extend=True)
            if not supports:
                supports = (start + mid).hull()
            else:
                supports += (start + mid).hull()
            supports += (mid + end).hull()

            start = plate.sm[row][column].get_corner("fr", x=3, y=2, x_extrude=0,
                                                             y_extrude=3, extend=True)
            mid = Cube(3).translate(center).translate([-distance, 0, 0])
            end = plate.sm[row][column].get_corner("br", x=3, y=2, x_extrude=0,
                                                              y_extrude=3, extend=True)

            supports += (start + mid).hull()
            supports += (mid + end).hull()
            supports -= plate.sm[row][column].transform(Cube(mount_width, center=True).translate([0,0,mount_width/2-3.5]))
            #rot_arc = plate.sm[row][column].transform(make_arc(mount_width - 5, 3, 0))
            switch_cut = (plate.sm[row][column].get_back(thickness=.01, extrude=3) +
                          plate.sm[row][column].get_front(thickness=.01, extrude=3) +
                          plate.sm[row][column].get_left(thickness=.01, extrude=3) +
                          plate.sm[row][column].get_right(thickness=.01, extrude=3) +
                          plate.sm[row][column].transform(Cube(40))).hull()
            #arc -= switch_cut
            #supports += rot_arc
        centers.append(row_centers)
    """
    for row in range(len(centers) - 1):
        for col in range(len(centers[row]) - 1):
            start = Cube(3).translate(centers[row][col]).translate([-distance, 0, 0])
            end = Cube(3).translate(centers[row + 1][col]).translate([-distance, 0, 0])
            supports += (start + end).hull()
    """
    for row in range(2, len(centers) -2):
        for col in range(len(centers[row]) - 1):
            start = Cube(3).translate(centers[row][col]).translate([-distance, 0, 0])
            end = Cube(3).translate(centers[row - 1][col + 1]).translate([-distance, 0, 0])
            supports += (start + end).hull()

    for row in range(1, len(centers) -2):
        for col in range(len(centers[row]) - 1):
            start = Cube(3).translate(centers[row - 1][col]).translate([-distance, 0, 0])
            end = Cube(3).translate(centers[row][col + 1]).translate([-distance, 0, 0])
            supports += (start + end).hull()
    start = Cube(3).translate(centers[2][0]).translate([-distance, 0, 0])
    end = Cube(3).translate(centers[3][1]).translate([-distance, 0, 0])
    supports += (start + end).hull()

    start = Cube(3).translate(centers[3][0]).translate([-distance, 0, 0])
    end = Cube(3).translate(centers[2][1]).translate([-distance, 0, 0])
    supports += (start + end).hull()

    start = Cube(3).translate(centers[3][0]).translate([-distance, 0, 0])
    end = Cube(3).translate(centers[4][1]).translate([-distance, 0, 0])
    supports += (start + end).hull()


    start = Cube(3).translate(centers[4][0]).translate([-distance, 0, 0])
    end = Cube(3).translate(centers[3][1]).translate([-distance, 0, 0])
    supports += (start + end).hull()

    start = Cube(3).translate(centers[3][1]).translate([-distance, 0, 0])
    end = Cube(3).translate(centers[4][2]).translate([-distance, 0, 0])
    supports += (start + end).hull()

    start = Cube(3).translate(centers[3][2]).translate([-distance, 0, 0])
    end = Cube(3).translate(centers[4][1]).translate([-distance, 0, 0])
    supports += (start + end).hull()

    #anchor = Sphere(thick).translate(centers[3][0]).translate([-distance, 0, 0])
    #supports += (Cube([3, 3, .1]).translate([-5, 100, 0]) + anchor).hull()

    anchor_1 = Sphere(thick).translate(centers[2][0]).translate([-distance, 0, 0])
    anchor_2 = Sphere(thick).translate(centers[1][0]).translate([-distance, 0, 0])
    anchor_3 = Sphere(thick).translate(centers[0][0]).translate([-distance, 0, 0])

    #supports += (Cube([15, 50, .1]).rotate([0,0,-40]).translate([-60, 80, 0]) + anchor_1 + anchor_2 + anchor_3).hull()

    arc = make_arc(90, 18.8251, [-15, 30, 80]).rotate([-20,10,30]).translate([-40, 80, 1])
    cube_size = 300
    arc -= Cube(cube_size, center=True).translate([0, 0, -cube_size/2])
    supports += arc

    #anchor = Sphere(thick).translate(centers[1][0]).translate([-distance, 0, 0])
    #supports += (Cube([3, 3, .1]).translate([-20, 100, 0]) + anchor).hull()

    return supports.color("Cyan")


plate = generate_main_plate()
thumb = generate_thumb_cluster(plate)
case = generate_case(plate, thumb)
supports = generate_supports(plate, thumb)

# cm: column_modifiers
# rm: row_modifiers
# im: indiv_modifiers
# ik: ignore_keys
# sm: switch_matrix


# hulls connecting thumb and matrix
#conn_hulls = (thumb.sm[1][1].get_corner("br", .5, 4, 3, 3).translate([-3, 0, 0]) + plate.sm[0][4].get_corner("bl", 7, 2, 4)).hull()
#conn_hulls = (thumb.sm[2][0].get_corner("fl", .5, 6, 3, 3) + plate.sm[2][0].get_corner("bl", 3, 3, 0)).hull()
conn_hulls = (thumb.sm[0][2].get_front(3, 3) + plate.sm[BOTTOM_ROW][MIDDLE].get_back(3, 3)).hull()
#   conn_hulls += (thumb.sm[0][2].get_back(3, 3) + plate.back_wall_hulls[MIDDLE]).hull()
conn_hulls += (thumb.sm[0][3].get_front(3, 3) + plate.sm[BOTTOM_ROW][INDEX].get_back(3, 3)).hull()
#   conn_hulls = (thumb.sm[0][2].get_back(3, 3) + plate.back_wall_hulls[RING]).hull()
#fr_corner = thumb.sm[0][3].get_corner("br", 3, 3, 3)
#br_corner = thumb.sm[0][3].get_corner("bl", 3, 3, 3)
#bbr_corner = thumb.sm[0][1].get_corner("br", 3, 3, 3)
#conn_hulls += (br_corner + plate.back_wall_hulls[RING]).hull()
#conn_hulls += (fr_corner + br_corner + plate.back_wall_hulls[RING]).hull()
#conn_hulls += (thumb.sm[0][2].get_right(3, 3) + fr_corner + br_corner + plate.back_wall_hulls[RING]).hull()
conn_hulls += (thumb.sm[0][1].get_back(3, 3) + plate.sm[BOTTOM_ROW][PINKY].get_back(3, 3)).hull()



#fr_corner = thumb.sm[1][2].get_corner("fr", 3, 3, 3)
#br_corner = thumb.sm[0][2].get_corner("br", 3, 3, 3)
#missing_hull = (fr_corner + br_corner).hull()
#conn_hulls += (missing_hull + plate.back_wall_hulls[RING]).hull()


#conn_hulls += (round_edges(Cube([10, 10, .1]).translate([-55, 70, 0])) + plate.sm[2][0].get_corner("bl", 18, 5, 3).translate([-3.5, -8, 0])).hull()


# right_hand = conn_hulls + thumb.get_matrix() + plate.get_matrix() - plate.left_wall
# right_hand = conn_hulls + thumb.get_matrix() + plate.get_matrix() + supports + conn_hulls
right_hand = sum_shapes(
    [thumb.get_matrix(), 
    plate.get_matrix(),
    conn_hulls,
    generate_back(plate, draft_version=True),
    generate_plate_outline(plate, draft_version=True).turn_on_debug(),
    generate_thumb_outline(thumb, draft_version=True)]
)

#right_hand = plate.sm[0][0].transform(make_arc())

#right_hand += transform(Cube(18, 2), plate.sm[2][0].transformations)
#self.mount_width
left_hand = right_hand.mirror([1, 0, 0])
(left_hand).write("pollex_left.scad")
(right_hand).write("pollex_right.scad")
