from pykeeb import DSA_KEY_WIDTH, Keyboard_matrix, Cylinder, project, Keyswitch_mount
from openpyscad import Cube, Sphere, Cylinder, Minkowski

# 13.80 was too much.
mount_width = 13.60
mount_height = 13.60
plate_thickness = 3
mount_width = 18.915


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
    INDEX_SIDE = 0
    INDEX = 1
    MIDDLE = 2
    RING = 3
    PINKY = 4
    X_MOV = 0
    Y_MOV = 1
    Z_MOV = 2
    X_ROT = 3
    Y_ROT = 4
    Z_ROT = 5

    # Shift columns back towards the base of the hand
    plate.cm[INDEX_SIDE][Y_MOV] += 0.8
    plate.cm[INDEX][Y_MOV]      += 0.8
    plate.cm[MIDDLE][Y_MOV]     += -3
    plate.cm[RING][Y_MOV]       += -8
    plate.cm[PINKY][Y_MOV]      += -16

    # Apply horizontal curvature
    h_curve = 6
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
    plate.im[center_row][INDEX_SIDE][X_MOV] -= 0.65
    plate.im[center_row][INDEX][X_MOV] -= 0.65
    plate.im[center_row][RING][X_MOV] += 0.65
    plate.im[center_row][PINKY][X_MOV] += 0.65

    # Create column cavities to account for different finger lengths
    plate.cm[INDEX_SIDE][Z_MOV] += 0
    plate.cm[INDEX][Z_MOV]      += 0
    plate.cm[MIDDLE][Z_MOV]     += -7
    plate.cm[RING][Z_MOV]       += -6
    plate.cm[PINKY][Z_MOV]      += -h_curve * .05

    # Shift the pinky finger column away from the other columns
    plate.cm[PINKY][X_MOV]      += .4
    return plate


def apply_walls_main(plate):
    # walls
    plate.side_wall_thickness = 3
    plate.side_extrude = 4
    plate.generate()

    modifiers = [[list(map(sum, zip(plate.rm[row], plate.cm[column], plate.im[row][column]))) for column in range(plate.columns)] for row in range(plate.rows)]
    modifiers = [[modifiers[row][column] + [plate.ik[row][column]] for column in range(plate.columns)] for row in range(plate.rows)]

    switch_matrix = []
    for row in range(plate.rows):
        switch_row = []
        for column in range(plate.columns):
            # Make the arc length longer for longer fingers
            row_spacing = plate.row_spacing
            if column == 2:
                row_spacing += 2.0
            if column == 3:
                row_spacing += 0.8
            if column == 4:
                row_spacing -= 2.2
            switch = Keyswitch_mount([list(map(sum, zip(modifiers[row][column][:3], [column * (plate.mount_width + plate.column_spacing), row * (plate.mount_length + row_spacing), 0]))) + modifiers[row][column][3:6], [plate.origin[0], plate.origin[1], plate.origin[2], plate.x_tent, plate.y_tent, plate.z_tent]], modifiers[row][column][6], plate.switch_type, plate.mount_length, plate.mount_width, plate.mx_notches)
            switch_row.append(switch)
        switch_matrix.append(switch_row)
    plate.sm = plate.switch_matrix = switch_matrix
    # Re-generate the hulls to account for the extended arcs
    plate.row_hulls = [[(plate.sm[row][column].get_front(plate.row_hull_thickness, plate.row_hull_extrude) + plate.sm[row+1][column].get_back(plate.row_hull_thickness, plate.row_hull_extrude)).hull() for column in range(plate.columns)] for row in range(plate.rows-1)]
    plate.column_hulls = [[(plate.sm[row][column].get_right(plate.col_hull_thickness, plate.col_hull_extrude) + plate.sm[row][column+1].get_left(plate.col_hull_thickness, plate.col_hull_extrude)).hull() for column in range(plate.columns - 1)] for row in range(plate.rows)]
    plate.corner_hulls = [[(plate.sm[row][column].get_corner("fr", plate.ch_thickness, plate.ch_thickness)
                        + plate.sm[row][column+1].get_corner("fl", plate.ch_thickness, plate.ch_thickness)
                        + plate.sm[row+1][column].get_corner("br", plate.ch_thickness, plate.ch_thickness)
                        + plate.sm[row+1][column+1].get_corner("bl", plate.ch_thickness, plate.ch_thickness)).hull() for column in range(plate.columns-1)] for row in range(plate.rows-1)]

    plate.right_wall = [project(plate.sm[row][plate.columns-1].get_right(plate.side_wall_thickness, plate.side_extrude)) for row in range(plate.rows)]
    plate.right_wall_hulls = [project((plate.sm[row][plate.columns-1].get_corner("fr", plate.side_wall_thickness, plate.wall_y, plate.side_extrude)
                        + plate.sm[row+1][plate.columns-1].get_corner("br", plate.side_wall_thickness, plate.wall_y, plate.side_extrude)).hull()) for row in range(plate.rows - 1)]
    plate.front_right_corner = project(plate.sm[plate.rows-1][plate.columns-1].get_corner("fr", plate.side_extrude, plate.wall_extrude, plate.side_extrude, plate.wall_extrude))

    left_wall = []
    for row in range(plate.rows):
        piece = plate.sm[row][0].get_left(plate.side_wall_thickness, plate.side_extrude).turn_on_debug()
        left_wall.append(piece)

    plate.left_wall = left_wall
    left_wall_hulls = []
    for row in range(plate.rows - 1):
        fl_corner = plate.sm[row][0].get_corner("fl",
                                                plate.side_wall_thickness,
                                                plate.wall_y,
                                                plate.side_extrude)
        bl_corner = plate.sm[row+1][0].get_corner("bl",
                                                  plate.side_wall_thickness,
                                                  plate.wall_y,
                                                  plate.side_extrude)
        left_wall_hulls.append((fl_corner + bl_corner).hull().turn_on_debug())
        #left_wall_hulls.append(fl_corner + bl_corner)
    plate.left_wall_hulls = left_wall_hulls

    front_wall = []
    for column in range(plate.columns):
        piece = plate.sm[plate.rows - 1][column].get_front(plate.side_wall_thickness, plate.side_extrude).turn_on_debug()
        front_wall.append(piece)

    plate.front_wall = front_wall

    # Remove walls from main matrix to curve them manually
    #plate.front_wall = [[] for column in range(plate.columns)]
    front_wall_hulls = []
    for column in range(plate.columns - 1):
        fr_corner = plate.sm[plate.rows - 1][column].get_corner("fr",
                                                                plate.wall_x,
                                                                plate.side_wall_thickness,
                                                                0,
                                                                plate.side_extrude)
        fl_corner = plate.sm[plate.rows - 1][column+1].get_corner("fl",
                                                                  plate.wall_x,
                                                                  plate.side_wall_thickness,
                                                                  0,
                                                                  plate.side_extrude)
        front_wall_hulls.append((fr_corner + fl_corner).hull().turn_on_debug())
    plate.front_wall_hulls = front_wall_hulls
    #plate.front_wall_hulls  = [[] for column in range(plate.columns - 1)]


    back_wall = []
    for column in range(plate.columns):
        piece = plate.sm[0][column].get_back(plate.side_wall_thickness, plate.side_extrude).turn_on_debug()
        back_wall.append(piece)

    plate.back_wall = back_wall
    #plate.back_wall = [[] for column in range(plate.columns)]
    back_wall_hulls = []
    for column in range(plate.columns - 1):
        br_corner = plate.sm[0][column].get_corner("br",
                                                   plate.wall_x,
                                                   plate.side_wall_thickness,
                                                   0,
                                                   plate.side_extrude)
        bl_corner = plate.sm[0][column+1].get_corner("bl",
                                                     plate.wall_x,
                                                     plate.side_wall_thickness,
                                                     0,
                                                     plate.side_extrude)
        back_wall_hulls.append((br_corner + bl_corner).hull().turn_on_debug())
    plate.back_wall_hulls = back_wall_hulls


    plate.front_left_corner = plate.sm[plate.rows-1][0].get_corner("fl", plate.side_extrude, plate.side_extrude, plate.side_extrude, plate.side_extrude).turn_on_debug()
    plate.back_left_corner = plate.sm[0][0].get_corner("bl", plate.side_extrude, plate.side_extrude, plate.side_extrude, plate.side_extrude).turn_on_debug()

    return plate


def generate_main_plate():
    num_rows = 3
    num_columns = 5
    plate = Keyboard_matrix(num_rows,
                            num_columns,
                            row_spacing=7.8,
                            column_spacing=2.7,
                            plate_thickness=plate_thickness,
                            origin=[0, 0, 110],
                            x_tent=0,
                            y_tent=78,
                            z_tent=-10,
                            mount_length=DSA_KEY_WIDTH,
                            mount_width=mount_width,
                            switch_type="mx",
                            mx_notches=False)
    plate = apply_rows_ergo_main(plate)
    plate = apply_columns_ergo_main(plate)
    plate = apply_walls_main(plate)
    return plate


def generate_thumb_cluster(plate):
    thumb_origin = list(map(sum, zip(plate.switch_matrix[0][0].transformations[0][0:3], [-34, -40, 75])))

    thumb = Keyboard_matrix(3,
                            3,
                            row_spacing=3.1,
                            column_spacing=2.4,
                            plate_thickness=plate_thickness,
                            origin=thumb_origin,
                            x_tent=40,
                            y_tent=-15,
                            z_tent=0,
                            mount_length=DSA_KEY_WIDTH,
                            mount_width=mount_width,
                            switch_type="mx",
                            mx_notches=False)
    plate.side_wall_thickness = 1
    h_curve = 18
    thumb.cm[0] = [0, 0, 0,  0, h_curve, 0]
    thumb.cm[1] = [0, 0, -h_curve * .2,  0, 0, 0]
    thumb.cm[2] = [0, 0, 0,  0, -h_curve, 0]

    v_curve = 12
    thumb.rm[0] = [0, 0, 0, -v_curve, 0, 0]
    thumb.rm[1] = [0, 0, -v_curve/5,  0, 0, 0]
    thumb.rm[2] = [0, 0, 0,  v_curve, 0, 0]

    thumb.ignore_keys[2][2] = True
    thumb.generate()
    thumb.right_wall = [[] for row in range(thumb.rows)]
    thumb.right_wall_hulls = [[] for row in range(thumb.rows)]
    thumb.left_wall[0] = []

    thumb.front_wall[2] = []
    thumb.front_wall[1] = []
    thumb.front_wall[0] = []
    thumb.front_wall_hulls[0] = []
    thumb.front_wall_hulls[1] = []

    thumb.front_right_corner = thumb.sm[thumb.rows-1][2].get_corner("fr", thumb.side_extrude, thumb.side_extrude, thumb.side_extrude, thumb.side_extrude).turn_on_debug()
    thumb.front_right_corner = []
    thumb.front_right_corner_hulls = []
    return thumb

plate = generate_main_plate()
thumb = generate_thumb_cluster(plate)

# cm: column_modifiers
# rm: row_modifiers
# im: indiv_modifiers
# ik: ignore_keys
# sm: switch_matrix


# hulls connecting thumb and matrix
conn_hulls = (thumb.sm[2][1].get_front(thickness=0.6) + plate.sm[0][0].get_back(thickness=.1, extrude=-6)).hull()
#conn_hulls = (thumb.sm[2][1].get_corner("fl", 4.5, 6, 3, 3) + plate.sm[0][0].get_corner("bl", 6, 3.5, 1).translate([6, -.2, 2.0])).hull()
conn_hulls = (thumb.sm[1][1].get_corner("br", .5, 4, 3, 3).translate([-3, 0, 0]) + plate.sm[0][4].get_corner("bl", 7, 2, 4)).hull()
conn_hulls += (thumb.sm[2][0].get_corner("fl", .5, 6, 3, 3) + plate.sm[1][0].get_corner("bl", 8, 1.2, 3)).hull()
conn_hulls += (round_edges(Cube([10, 10, .1]).translate([-55, 70, 0])) + plate.sm[2][0].get_corner("bl", 18, 5, 3).translate([-3.5, -8, 0])).hull()


# right_hand = conn_hulls + thumb.get_matrix() + plate.get_matrix() - plate.left_wall
cyl = Cylinder(38, 24, center=True).rotate([90,0,0])
cable_hole = cyl.translate([-12, -48, 42]).color("Blue")
cable_hole += cyl.translate([-12, -48, 18]).color("Blue")
right_hand = conn_hulls + thumb.get_matrix() + plate.get_matrix() - cable_hole
#right_hand += transform(Cube(18, 2), plate.sm[2][0].transformations)
#self.mount_width
left_hand = right_hand.mirror([1, 0, 0])
(left_hand).write("radical_ergo_left.scad")
(right_hand).write("radical_ergo_right.scad")
