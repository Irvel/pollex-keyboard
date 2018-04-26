from pykeeb import DSA_KEY_WIDTH, Keyboard_matrix, Cylinder, project
from math import *
import sys

columns = 5
rows = 3

# 13.80 was too much.
mount_width = 13.50
mount_height = 13.50
# mount_width = DSA_KEY_WIDTH - .8
mount_width = DSA_KEY_WIDTH + .5
plate = Keyboard_matrix(rows,
                        columns,
                        row_spacing=3,
                        column_spacing=2,
                        plate_thickness=3,
                        origin=[0, 0, 75],
                        x_tent=-35,
                        y_tent=30,
                        z_tent=-40,
                        mount_length=DSA_KEY_WIDTH,
                        mount_width=mount_width,
                        switch_type="mx",
                        mx_notches=True)

# cm: column_modifiers
# rm: row_modifiers
# im: indiv_modifiers
# ik: ignore_keys
##left to right are columns 0 and up, bottom to up are rows 0 and up
v_curvature = 20
plate.rm[0] = [0, 0, 0, -v_curvature, 0, 0]
plate.rm[1] = [0, 0, -v_curvature/columns, 0, 0, 0]
plate.rm[2] = [0, 0, 0, v_curvature, 0, 0]

h_curvature = 14
plate.cm[0] = [0,   0,    h_curvature * .05,  0,  h_curvature * 1.4,   0]
plate.cm[1] = [0,   0,    -h_curvature * .4,  0,  h_curvature,  0]
plate.cm[2] = [0,   0,   -h_curvature * .6,  0,   0,  0]  # long finger column up
plate.cm[3] = [0,   0,    -h_curvature * .4,  0,  -h_curvature,   0]
plate.cm[4] = [0,   0,    h_curvature * .05,  0, -h_curvature * 1.4,   0]   # offset the pinky back and outwards

# Middle row, first column. Bring the key outward.
plate.im[1][0][0] -= 1
plate.im[1][1][0] -= 1

# We skip the center key [1][2]
plate.im[1][3][0] += 1
plate.im[1][4][0] += 1

plate.generate()

# arc
arc_origin = list(map(sum, zip(plate.switch_matrix[0][0].transformations[0][0:3], [-40, -44, 50])))

arc = Keyboard_matrix(2,
                      3,
                      row_spacing=0.5,
                      column_spacing=2,
                      plate_thickness=3,
                      origin=arc_origin,
                      x_tent=40,
                      y_tent=0,
                      z_tent=0,
                      mount_length=DSA_KEY_WIDTH,
                      mount_width=mount_width,
                      switch_type="mx",
                      mx_notches=True)
h_curve = 18
arc.cm[0] = [0, 0, 0,  0, h_curve, 0]
arc.cm[1] = [0, 0, -h_curve * .2,  0, 0, 0]
arc.cm[2] = [0, 0, 0,  0, -h_curve, 0]

v_curve = 8
arc.rm[0] = [0, 0, 0, -v_curve, 0, 0]
arc.rm[1] = [0, 0, 0,  v_curve, 0, 0]
arc.generate()


#hulls connecting arc and matrix

conn_hulls = (arc.sm[1][2].get_front(thickness=0.6) + plate.sm[0][0].get_back()).hull()
conn_hulls += project((arc.sm[1][1].get_corner('fl', 1.6, 8.5, 0, 9) + plate.sm[0][0].get_corner('bl', 2, .5, 3, 3)).hull())

right_hand = conn_hulls + arc.get_matrix() + plate.get_matrix()
left_hand = right_hand.mirror([1, 0, 0])
(left_hand).write("radical_ergo_left.scad")
(right_hand).write("radical_ergo_right.scad")
