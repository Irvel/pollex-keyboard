import numpy as np


def rotate(point, rotation):
    assert len(point) == 3
    assert len(rotation) == 3
    # Force a column vector
    point = np.array(point).reshape((3, 1))

    theta_x = np.radians(rotation[0])
    x_rot_mat = [[1.0,                0.0,                 0.0],
                 [0.0,    np.cos(theta_x),    -np.sin(theta_x)],
                 [0.0,    np.sin(theta_x),     np.cos(theta_x)]]
    x_rot_mat = np.array(x_rot_mat)

    theta_y = np.radians(rotation[1])
    y_rot_mat = [[np.cos(theta_y),     0.0,     np.sin(theta_y)],
                 [0.0,                 1.0,                 0.0],
                 [-np.sin(theta_y),    0.0,     np.cos(theta_y)]]
    y_rot_mat = np.array(y_rot_mat)

    theta_z = np.radians(rotation[2])
    z_rot_mat = [[np.cos(theta_z),    -np.sin(theta_z),     0.0],
                 [np.sin(theta_z),     np.cos(theta_z),     0.0],
                 [0.0,                             0.0,    1.0]]
    z_rot_mat = np.array(z_rot_mat)

    rotated_point = np.dot(x_rot_mat, point)
    rotated_point = np.dot(y_rot_mat, rotated_point)
    rotated_point = np.dot(z_rot_mat, rotated_point)
    return [p[0] for p in rotated_point.tolist()]


def translate(point, shift_list):
    translated_x = point[0] + shift_list[0]
    translated_y = point[1] + shift_list[1]
    translated_z = point[2] + shift_list[2]
    return [translated_x, translated_y, translated_z]


def sum_shapes(shapes):
    # The built-in Python sum() doesn't work with shapes
    if len(shapes) == 1:
        return shapes[0]
    total = shapes[0]
    for shape in shapes[1:]:
        total += shape
    return total


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

    # print(vector_a)
    # print(vector_b, "\n")
    # print(start_deadband, interpolated_steps, end_deadband)

    trajectory = [vector_a for _ in range(start_deadband)]
    intermediate = vector_a.copy().astype("float64")
    for _ in range(interpolated_steps):
        intermediate += step
        trajectory.append(intermediate.copy())
    trajectory.extend([vector_b for _ in range(end_deadband)])
    return trajectory


def interpolate_cuadratic_bezier(point_a, point_b, control_point, segments=10):
    curve_points = []
    for seg in range(segments):
        t = seg / segments
        curve_point = ((1-t)**2 * point_a + 2*(1-t)*t*control_point + t**2 * point_b)
        curve_points.append(curve_point)
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
