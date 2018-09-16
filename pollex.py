from pykeeb import DSA_KEY_WIDTH, Keyboard_matrix, Cylinder, project, Keyswitch_mount
from openpyscad import Cube, Sphere, Cylinder, Minkowski, Circle, Polygon
from functools import reduce

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
    rotation_angles = [0,0,0]
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
    plate.cm[INDEX_SIDE][Y_MOV] += -3
    plate.cm[INDEX][Y_MOV]      += -3
    plate.cm[MIDDLE][Y_MOV]     += -3
    plate.cm[RING][Y_MOV]       += -8
    plate.cm[PINKY][Y_MOV]      += -19

    # Apply horizontal curvature
    h_curve = 2
    plate.cm[INDEX_SIDE][Y_ROT] += h_curve * 1.2
    plate.cm[INDEX][Y_ROT]      += h_curve
    plate.cm[MIDDLE][Y_ROT]     += 0
    plate.cm[RING][Y_ROT]       += -h_curve * 1.2
    plate.cm[PINKY][Y_ROT]      += -h_curve

    # Compensate mount heights for the horizontal curvature
    plate.cm[INDEX_SIDE][Z_MOV] += h_curve * .05
    plate.cm[INDEX][Z_MOV]      += -h_curve * .4
    plate.cm[MIDDLE][Z_MOV]     += -h_curve * .6
    plate.cm[RING][Z_MOV]       += -h_curve * .4
    plate.cm[PINKY][Z_MOV]      += h_curve * .05

    # Get rid of x shift to the right in the center row because of the horizontal curvature
    center_row = plate.rows // 2
    # Shifting the entire row does not compensate in the way we want, so we apply the shifting
    # to individual mounts instead, except for the middle finger one.
    plate.im[center_row][INDEX_SIDE][X_MOV] -= h_curve / 10
    plate.im[center_row][INDEX][X_MOV] -= h_curve / 10
    plate.im[center_row][RING][X_MOV] += h_curve / 10
    plate.im[center_row][PINKY][X_MOV] += h_curve / 10

    # Create column cavities to account for different finger lengths
    plate.cm[INDEX_SIDE][Z_MOV] += -3
    plate.cm[INDEX][Z_MOV]      += -3
    plate.cm[MIDDLE][Z_MOV]     += -8
    plate.cm[RING][Z_MOV]       += -6
    plate.cm[PINKY][Z_MOV]      += -4

    # Shift the pinky finger column away from the other columns
    plate.cm[PINKY][X_MOV]      += .4

    # Shift index side column towards the index
    plate.cm[INDEX_SIDE][X_MOV]      += 1.2


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
                            origin=[0, 0, 91],
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
    thumb_origin = list(map(sum, zip(plate.switch_matrix[0][0].transformations[0][0:3], [-23, -36, 29])))

    thumb = Keyboard_matrix(1,
                            5,
                            row_spacing=3.1,
                            column_spacing=3.8,
                            plate_thickness=plate_thickness,
                            origin=thumb_origin,
                            x_tent=-5,
                            y_tent=-52,
                            z_tent=15,
                            mount_length=DSA_KEY_WIDTH,
                            mount_width=mount_width,
                            switch_type="mx",
                            mx_notches=False)
    plate.side_wall_thickness = 1
    h_curve = 36
    thumb.cm[0] = [ 13, -16,   h_curve * 1.0,  11,  h_curve * 2.4,  16]
    thumb.cm[1] = [ -1,  -8,   h_curve * .42,  5,  h_curve * 1.3,  8]
    thumb.cm[2] = [  0,   0,   h_curve * .15,  0,              0,  0]
    thumb.cm[3] = [  1,  -8,   h_curve * .42,  5, -h_curve * 1.3,  -8]
    thumb.cm[4] = [-13, -16,   h_curve * 1.0,  11, -h_curve * 2.4,  -16]



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


    # Remove corners and walls
    thumb.back_wall = [[] for row in range(thumb.columns)]
    thumb.back_wall_hulls = [[] for row in range(thumb.columns)]
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

    thumb.front_right_corner = thumb.sm[thumb.rows-1][2].get_corner("fr", thumb.side_extrude, thumb.side_extrude, thumb.side_extrude, thumb.side_extrude).turn_on_debug()
    thumb.front_right_corner = []
    thumb.front_right_corner_hulls = []

    thumb.front_left_corner = []

    front_wall = []
    for column in range(thumb.columns):
        piece = thumb.sm[thumb.rows - 1][column].get_front(thumb.side_wall_thickness, thumb.side_extrude)
        front_wall.append(piece)
    thumb.front_wall = front_wall

    #thumb.left_wall[2] = thumb.sm[2][0].get_left(3, 3)
    #thumb.left_wall[1] = thumb.sm[1][0].get_left(3, 3)
    #thumb.front_left_corner = thumb.sm[thumb.rows-1][0].get_corner("fl", thumb.side_extrude, thumb.side_extrude, thumb.side_extrude, thumb.side_extrude).turn_on_debug()
    return thumb

def generate_back(plate):
    print(plate.sm[CENTER_ROW][INDEX_SIDE].transformations)
    print(dir(plate.sm[CENTER_ROW][INDEX_SIDE]))
    detail = 110
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

    top_bevel, top_height, top_radius = top_double_bevel(initial_radius=51, 
                                                         first_length=.6, 
                                                         first_angle=32, 
                                                         second_length=6, 
                                                         second_angle=50)
    top_bevel = top_bevel.translate([-45.5, -2.3, -13])
    top_center_key = plate.sm[CENTER_ROW][INDEX_SIDE]
    top_bevel = top_center_key.transform(top_bevel.rotate([0,90,0]))
    top_top_key = plate.sm[TOP_ROW][INDEX_SIDE]
    #top_bevel = top_bevel.translate([0, 0, 10])
    def mount_corner(radius, height, key_mount, corner_type, shape, x_offset=0, y_offset=0):
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
            cyl2 = Cylinder(r=radius, h=height, center=True, _fn=detail).translate([radius * 9.461, 0, 0])
            cylinder = Cylinder(r=radius, h=height, center=True, _fn=detail)
            corner = cube + cylinder + cyl2
        # Middle to Pinky long shifted side. 
        elif shape == "cyli_cube_5":
            cube = Cube([radius * 2, radius, height], center=True)
            cube = cube.translate([0, -radius/2, 0]) #+ cube.translate([-radius/2, 0, 0])
            cylinder = Cylinder(r=radius, h=height, center=True, _fn=detail)
            cyl2 = Cylinder(r=radius, h=height, center=True, _fn=detail).translate([radius * 9.461, 0, 0])
            corner = cube + cylinder + cyl2
        # Middle finger to index shifted side. 
        elif shape == "cyli_cube_6":
            cube = Cube([radius * 2, radius, height], center=True)
            cube = cube.translate([0, radius/2, 0]) #+ cube.translate([-radius/2, 0, 0])
            cylinder = Cylinder(r=radius, h=height, center=True, _fn=detail)
            cyl2 = Cylinder(r=radius, h=height, center=True, _fn=detail).translate([-radius * 9.461, 0, 0])
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
        translate_vec = [m * sig for m, sig in zip(shift_magnitudes, corner_map[corner_type])]
        translate_vec[0] += x_offset
        translate_vec[1] += y_offset
        corner = corner.translate(translate_vec)
        corner = key_mount.transform(corner)
        return corner
    
    def rounded_horizontal_side(side, corner_radius, corner_height):
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
            else:
                shape="cube"
            corner1 = mount_corner(radius=corner_radius, 
                                   height=corner_height, 
                                   key_mount=plate.sm[row_idx][col_idx], 
                                   corner_type="b" + corner_pos,
                                   shape=shape)
            if row_idx == (plate.rows - 1):
                shape="cylinder"
            else:
                shape="cube"
            corner2 = mount_corner(radius=corner_radius, 
                                   height=corner_height, 
                                   key_mount=plate.sm[row_idx][col_idx], 
                                   corner_type="t" + corner_pos,
                                   shape=shape)
            edge_list.append((corner1 + corner2).hull())
            if row_idx != 0 and prev_corner:
                edge_list.append((prev_corner + corner1).hull())
            prev_corner = corner2
        return edge_list

    def rounded_vertical_side(side, corner_radius, corner_height):
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
                    shape="cyli_cube_4"
                    offset = 3.99
                else:
                    shape = "cyli_cube_3"
                    offset = 0
            elif col_idx == PINKY:
                shape="cyli_cube_5"
                offset = 3.99
                if side == "bottom":
                    offset = 0
                    shape = "cyli_cube_3"
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
                                   x_offset=offset)
            if col_idx == (plate.columns - 1):
                shape="cylinder"
            else:
                shape="cube"
            offset = 0
            if col_idx == INDEX_SIDE:
                offset = -4
            elif col_idx == INDEX:
                if side == "bottom":
                    shape = "cyli_cube_3"
                else:
                    shape = "cyli_cube_2"
                offset = -3.99
            elif col_idx == MIDDLE:
                if side == "bottom":
                    offset = -3.99
                    shape = "cyli_cube_6"
                else:
                    shape = "cyli_cube_2"
            elif col_idx == RING:
                if side == "bottom":
                    offset = -3.99
                    shape = "cyli_cube_6"
                else:
                    shape = "cyli_cube_2"
        
            corner2 = mount_corner(radius=corner_radius, 
                                   height=corner_height, 
                                   key_mount=plate.sm[row_idx][col_idx], 
                                   corner_type=corner_pos + "r",
                                   shape=shape,
                                   x_offset=offset)
            edge_list.append((corner1 + corner2).hull())
            if col_idx != 0 and prev_corner:
                edge_list.append((prev_corner + corner1).hull())
            prev_corner = corner2
        return edge_list

    edge_list = rounded_horizontal_side(side="left", corner_radius=2, corner_height=3)
    edge_list.extend(rounded_horizontal_side(side="right", corner_radius=2, corner_height=3))
    edge_list2 = rounded_vertical_side(side="top", corner_radius=2, corner_height=3)
    edge_list2.extend(rounded_vertical_side(side="bottom", corner_radius=2, corner_height=3))
    return reduce((lambda a, b: a + b), edge_list + edge_list2).turn_on_debug()

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
right_hand =  thumb.get_matrix() + plate.get_matrix() + generate_back(plate)


#right_hand = plate.sm[0][0].transform(make_arc())

#right_hand += transform(Cube(18, 2), plate.sm[2][0].transformations)
#self.mount_width
left_hand = right_hand.mirror([1, 0, 0])
(left_hand).write("pollex_left.scad")
(right_hand).write("pollex_right.scad")
