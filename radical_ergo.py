from pykeeb import DSA_KEY_WIDTH, Keyboard_matrix, Cylinder, project
from openpyscad import Cube, Sphere, Cylinder, Minkowski

# 13.80 was too much.
mount_width = 13.60
mount_height = 13.60
plate_thickness = 3


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
    IR = 1
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


columns = 5
rows = 3


# mount_width = DSA_KEY_WIDTH - .8
mount_width = DSA_KEY_WIDTH + .5
plate = Keyboard_matrix(rows,
                        columns,
                        row_spacing=6.0,
                        column_spacing=2,
                        plate_thickness=plate_thickness,
                        origin=[0, 0, 110],
                        x_tent=0,
                        y_tent=65,
                        z_tent=-18,
                        mount_length=DSA_KEY_WIDTH,
                        mount_width=mount_width,
                        switch_type="mx",
                        mx_notches=False)

# cm: column_modifiers
# rm: row_modifiers
# im: indiv_modifiers
# ik: ignore_keys
# sm: switch_matrix
# left to right are columns 0 and up, bottom to up are rows 0 and up
v_curvature = 36
plate.rm[0] = [0, 0, 0, -v_curvature, 0, 0]
plate.rm[1] = [0, 0, -v_curvature/columns - 2, 0, 0, 0]
plate.rm[2] = [0, 0, 0, v_curvature, 0, 0]

h_curvature = 6
plate.cm[0] = [0,   3.6,    h_curvature * .05,  0,  h_curvature * 1.4,   0]
plate.cm[1] = [0,   3.6,    -h_curvature * .4,  0,  h_curvature,  0]
plate.cm[2] = [0,   3,   -h_curvature * .6 - 12,  0,   0,  0]  # long finger column up
plate.cm[3] = [0,   -8,    -h_curvature * .4 - 12,  0,  -h_curvature,   0]
plate.cm[4] = [.5,  -16,    h_curvature * .05,  0, -h_curvature * 1.4,   0]   # offset the pinky back and outwards

# Middle row, first column. Bring the key outward.
plate.im[1][0][0] -= 1
plate.im[1][1][0] -= 1

# We skip the center key [1][2]
plate.im[1][3][0] += 1
plate.im[1][4][0] += 1



# Thumb cluster
thumb_origin = list(map(sum, zip(plate.switch_matrix[0][0].transformations[0][0:3], [-35, -32, 60])))

thumb = Keyboard_matrix(2,
                        3,
                        row_spacing=0.5,
                        column_spacing=2,
                        plate_thickness=3,
                        origin=thumb_origin,
                        x_tent=60,
                        y_tent=0,
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

v_curve = 8
thumb.rm[0] = [0, 0, 0, -v_curve, 0, 0]
thumb.rm[1] = [0, 0, 0,  v_curve, 0, 0]
thumb.generate()
thumb.right_wall = [[] for row in range(thumb.rows)]
thumb.right_wall_hulls = [[] for row in range(thumb.rows)]
thumb.left_wall[0] = []

thumb.front_wall[2] = []
thumb.front_wall[1] = []
thumb.front_wall_hulls[0] = []
thumb.front_wall_hulls[1] = []

thumb.front_right_corner = thumb.sm[thumb.rows-1][2].get_corner("fr", thumb.side_extrude, thumb.side_extrude, thumb.side_extrude, thumb.side_extrude).turn_on_debug()
thumb.front_right_corner = []
thumb.front_right_corner_hulls = []


# hulls connecting thumb and matrix

conn_hulls = (thumb.sm[1][2].get_front(thickness=0.6) + plate.sm[0][0].get_back(thickness=.1, extrude=-6)).hull()
conn_hulls = (thumb.sm[1][2].get_corner("fl", .5, 3, 3, 3) + plate.sm[0][0].get_corner("bl", 1, 3.5, 1).translate([7, -.6, 5.0])).hull()
conn_hulls += (thumb.sm[1][2].get_corner("br", .5, 3, 3, 3).translate([-3, 0, 0]) + plate.sm[0][4].get_corner("bl", 1, 1.5, 1).translate([-12, -4.6, 0.0])).hull()
conn_hulls += (thumb.sm[0][0].get_corner("fl", .5, 3, 3, 3) + plate.sm[2][0].get_corner("bl", 1, .6, 1).translate([-44.4, -24, -24])).hull()
conn_hulls += (plate.sm[2][0].get_corner("bl", 1, 2.2, 1).translate([-4.4, 4, 0]) + plate.sm[2][0].get_corner("bl", 1, .6, 1).translate([-44.4, -24, -24])).hull()
#conn_hulls += project((thumb.sm[1][1].get_corner("fl", 1.6, 8.5, 0, 9) + plate.sm[0][0].get_corner("bl", 2, .5, 3, 3)).hull())




# walls

plate.side_wall_thickness = 3

plate.side_extrude = 4
plate.generate()
left_wall = []
for row in range(plate.rows):
    piece = plate.sm[row][0].get_left(plate.side_wall_thickness, plate.side_extrude).turn_on_debug()
    #sphere = Cylinder(r=3, h=3, center=True)
    #piece = make_round(piece)
    #piece = (piece + piece.translate([-110, 0, -400])).hull() + Cube(0) - Cube([500, 500, 250], center=True).translate([0, 0, -125])
    #sphere = Cylinder(r=-.5, h=3, center=True)
    #sphere = transform_switch(sphere, plate.sm[row][0].transformations)
    #piece += sphere
    #piece.append(sphere)
    #import ipdb; ipdb.set_trace()
    #piece = piece.translate([-1, 2, 0])
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

"""
self.back_wall = [project(self.sm[0][column].get_back(self.wall_thickness, self.wall_extrude)) for column in range(self.columns)]
        self.back_wall_hulls = [project((self.sm[0][column].get_corner("br", self.wall_x, self.wall_thickness, 0, self.wall_extrude)
                    + self.sm[0][column+1].get_corner('bl', self.wall_x, self.wall_thickness, 0, self.wall_extrude))).hull() for column in range(self.columns - 1)]
"""
    #projection = project((plate.sm[row][0].get_corner("fl", plate.side_wall_thickness, plate.wall_y, plate.side_extrude)
    #plate.left_wall_hulls = [project((plate.sm[row][0].get_corner("fl", plate.side_wall_thickness, plate.wall_y, plate.side_extrude)
    #+ plate.sm[row+1][0].get_corner("bl", plate.side_wall_thickness, plate.wall_y, plate.side_extrude)).hull()) for row in range(plate.rows - 1)]
#plate.left_wall_hulls = [project((plate.sm[row][0].get_corner("fl", plate.side_wall_thickness, plate.wall_y, plate.side_extrude)
 # + plate.sm[row+1][0].get_corner("bl", plate.side_wall_thickness, plate.wall_y, plate.side_extrude)).hull()) for row in range(plate.rows - 1)]




# right_hand = conn_hulls + thumb.get_matrix() + plate.get_matrix() - plate.get_walls() - thumb.get_walls()
#right_hand = conn_hulls + thumb.get_matrix() + plate.get_matrix() - plate.left_wall
front_walls = front_wall[0]
for wall in front_wall:
    front_walls += wall
for wall_hull in front_wall_hulls:
    front_walls += wall_hull
#front_walls = front_wall + front_wall_hulls
cyl = Cylinder(100, 17, center=True).rotate([90,0,0])
cable_hole = (cyl + cyl.translate([12,-1,0])).hull().translate([-20, -25, 12]).color("Blue")
cable_hole += (cyl + cyl.translate([12,-1,0])).hull().translate([-20, -25, 28]).color("Blue")
right_hand = conn_hulls + thumb.get_matrix() + plate.get_matrix() + front_walls - cable_hole
#right_hand += transform(Cube(18, 2), plate.sm[2][0].transformations)
#self.mount_width
left_hand = right_hand.mirror([1, 0, 0])
(left_hand).write("radical_ergo_left.scad")
(right_hand).write("radical_ergo_right.scad")
