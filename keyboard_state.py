"""
KeyMatrix
takes in a plate
removes walls and hulls
copies transformations from every key_mount
generates walls and hulls

.plate  -->  plate.get_matrix()
.outline
.case


KeyMount
Key itself
center
rotation


Shape
Junction
Cylinder
Cube
Wall
"""
import collections
import numpy as np


X = 0
Y = 1
Z = 2
dimensions = 3


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


def fetch_translation(transformations, origin=[0, 0, 0]):
    final_translation = origin
    for transformation in transformations:
        rotation = transformation[3:]
        final_translation = rotate(final_translation, rotation)

        translation = transformation[:3]
        final_translation = translate(final_translation, translation)
    return final_translation


def fetch_rotation(transformations):
    rotation = np.zeros(shape=(dimensions,), dtype=np.float64)
    for transformation in transformations:
        rotation += np.array(transformation[3:])
    return rotation


def make_3d_vector(values):
    assert len(values) == 3
    return np.array(values, dtype=np.float64)


def is_matrix_border(*, num_rows, num_columns, row_idx, col_idx):
    assert num_rows > 0
    assert num_columns > 0
    is_row_bottom_border = row_idx == (num_rows - 1)
    is_row_top_border = row_idx == 0
    is_col_bottom_border = col_idx == (num_columns - 1)
    is_col_top_border = col_idx == 0
    is_row_border = is_row_bottom_border or is_row_top_border
    is_col_border = is_col_bottom_border or is_col_top_border
    return is_row_border or is_col_border


def simulate_clockwise_path(num_rows, num_columns):
    assert num_rows >= 2
    assert num_columns >= 2

    def reached_limit(row, col, row_step):
        row_limit = (row >= num_rows - 1) or (row <= 0)
        col_limit = (col >= num_columns - 1) or (col <= 0)
        if row_step:
            return row_limit
        else:
            return col_limit

    row, col = 0, 0
    row_step, col_step = 0, 1
    sign = 1
    path = []
    limit_flag = False
    while True:
        path.append((row, col))
        row += sign * row_step
        col += sign * col_step
        if reached_limit(row, col, row_step=row_step):
            if limit_flag:
                sign *= -1
                limit_flag = False
            else:
                limit_flag = True
            row_step, col_step = col_step, row_step
        if (row, col) == (0, 0):
            break
    return path


def get_corner_position(center_position, size, corner_type):
    sign_map = {
        #               X   Y  Z
        "up_left":    [-1,  1, 0],
        "up_right":   [1,   1, 0],
        "down_left":  [-1, -1, 0],
        "down_right": [1,  -1, 0],
    }
    corner_sign = np.array(sign_map[corner_type])
    corner_translation = (size / 2) * corner_sign
    return center_position + corner_translation


def get_side_position(center_position, size, side_type, expand_distance=0):
    sign_map = {
        #         X   Y  Z
        "up":    [0,  1, 0],
        "down":  [0, -1, 0],
        "left":  [-1, 0, 0],
        "right": [1,  0, 0],
    }
    side_sign = np.array(sign_map[side_type])
    side_translation = ((size / 2) + expand_distance) * side_sign
    if isinstance(center_position, Position):
        side_translation = rotate(
            point=side_translation,
            rotation=center_position.rotation,
        )
    return center_position + side_translation


class KeyboardState(object):
    def __init__(self, pykeeb_matrix):
        self.num_rows = pykeeb_matrix.rows
        self.num_columns = pykeeb_matrix.columns
        assert self.num_rows <= 3
        assert self.num_columns <= 5
        self.wall_thickness = pykeeb_matrix.wall_thickness
        self.pykeeb_matrix = pykeeb_matrix
        self._border_mount_map = collections.OrderedDict()
        self.extract_switch_mounts()

    @property
    def border_mounts(self):
        return list(self._border_mount_map.values())

    @property
    def up_left_idx(self):
        return self.num_rows - 1, 0

    @property
    def up_right_idx(self):
        return self.num_rows - 1, self.num_columns - 1

    @property
    def down_left_idx(self):
        return 0, 0

    @property
    def down_right_idx(self):
        return 0, self.num_columns - 1

    def mount(self, row_idx, col_idx):
        assert row_idx < self.num_rows
        assert col_idx < self.num_columns
        return self.mount_matrix[row_idx][col_idx]

    def remove_pykeeb_walls(self):
        pass

    def extract_switch_mounts(self):
        self.mount_matrix = [[] for _ in range(self.num_rows)]
        border_idx_path = simulate_clockwise_path(
            num_rows=self.num_rows, num_columns=self.num_columns
        )
        unordered_mount_map = {}
        for row_idx, row in enumerate(self.pykeeb_matrix.sm):
            for col_idx, pykeeb_switch_mount in enumerate(row):
                is_border = self.mount_is_border(row_idx, col_idx)
                keymount = KeyMount(
                    switch_mount=pykeeb_switch_mount,
                    parent_matrix=self,
                    row_idx=row_idx,
                    col_idx=col_idx,
                )
                self.mount_matrix[row_idx].append(keymount)
                if is_border:
                    unordered_mount_map[(row_idx, col_idx)] = keymount
        for mount_idx in border_idx_path:
            keymount = unordered_mount_map[mount_idx]
            self._border_mount_map[mount_idx] = keymount

    def mount_is_border(self, row_idx, col_idx):
        return is_matrix_border(
            num_rows=self.num_rows,
            num_columns=self.num_columns,
            col_idx=col_idx,
            row_idx=row_idx,
        )

    def next_border_mount(self, row_idx, col_idx):
        assert self.mount_is_border(row_idx, col_idx)
        border_indices = list(self._border_mount_map.keys())
        current_idx = border_indices.index((row_idx, col_idx))
        if current_idx == len(border_indices) - 1:
            next_idx = 0
        else:
            next_idx = current_idx + 1
        next_mount_key = border_indices[next_idx]
        return self._border_mount_map(next_mount_key)

    def previous_border_mount(self, row_idx, col_idx):
        assert self.mount_is_border(row_idx, col_idx)
        border_indices = list(self._border_mount_map.keys())
        current_idx = border_indices.index((row_idx, col_idx))
        if current_idx == 0:
            previous_idx = len(border_indices) - 1
        else:
            previous_idx = current_idx - 1
        previous_mount_key = border_indices[previous_idx]
        return self._border_mount_map(previous_mount_key)

    def __repr__(self):
        return (
            f"KeyboardState( \n"
            f"num_rows: {self.num_rows} \n"
            f"num_columns: {self.num_columns} \n"
            f"wall_thickness: {self.wall_thickness} \n"
            f"border_mount_map ({len(self._border_mount_map.keys())}): "
            f"{self._border_mount_map.keys()} \n\n"
            f"mount_matrix ({self.num_rows * self.num_columns}):\n"
            f"{self.mount_matrix}\n"
        )


class KeyMount(object):
    def __init__(self, switch_mount, parent_matrix, row_idx, col_idx):
        self._row_idx = row_idx
        self._col_idx = col_idx
        self.center = Position.from_transform(switch_mount.transformations)
        self.size = Size(
            size_x=switch_mount.mount_width,
            size_y=switch_mount.mount_length,
            size_z=switch_mount.thickness
        )
        self.openscad_solid = switch_mount.switch_mount
        self.parent_matrix = parent_matrix
        self.walls = []
        self.side_expand_distance = 0

    @property
    def row_idx(self):
        return self._row_idx

    @property
    def col_idx(self):
        return self._col_idx

    @property
    def up_left_corner(self):
        return get_corner_position(
            center_position=self.center,
            size=self.size,
            corner_type="up_left"
        )

    @property
    def up_right_corner(self):
        return get_corner_position(
            center_position=self.center,
            size=self.size,
            corner_type="up_right"
        )

    @property
    def down_left_corner(self):
        return get_corner_position(
            center_position=self.center,
            size=self.size,
            corner_type="down_left"
        )

    @property
    def down_right_corner(self):
        return get_corner_position(
            center=self.center,
            size=self.size,
            corner_type="down_right"
        )

    @property
    def up_side(self):
        return get_side_position(
            center_position=self.center,
            size=self.size,
            side_type="up"
        )

    @property
    def down_side(self):
        return get_side_position(
            center_position=self.center,
            size=self.size,
            side_type="down"
        )

    @property
    def left_side(self):
        return get_side_position(
            center_position=self.center,
            size=self.size,
            side_type="left",
            expand_distance=self.side_expand_distance,
        )

    @property
    def right_side(self):
        return get_side_position(
            center_position=self.center,
            size=self.size,
            side_type="right",
            expand_distance=self.side_expand_distance,
        )

    @property
    def outer_sides(self):
        sides = []
        types = []
        if self._col_idx == self.parent_matrix.num_columns - 1:
            sides.append(self.right_side)
            types.append("right")

        if self._row_idx == self.parent_matrix.num_rows - 1:
            sides.append(self.up_side)
            types.append("up")

        if self._col_idx == 0:
            sides.append(self.left_side)
            types.append("left")

        if self._row_idx == 0:
            sides.append(self.down_side)
            types.append("down")

        # Make sure the outer sides order matches clockwise rotation.
        if (self._col_idx == self.parent_matrix.num_columns - 1
                and self._row_idx == 0):
            sides.reverse()
            types.reverse()
        return sides, types

    def fetch_double_outer_sides(self, offset_to_corner):
        sides, types = self.outer_sides
        if len(sides) <= 1:
            # One side means we're in the middle of either a row or column.
            offset_to_corner = 0
        doubled_sides = []
        for side, side_type in zip(sides, types):
            if side_type is "left":
                axis_mask = np.array([0, 1, 0])
            elif side_type is "right":
                axis_mask = np.array([0, -1, 0])
            elif side_type is "up":
                axis_mask = np.array([1, 0, 0])
            else:
                axis_mask = np.array([-1, 0, 0])
            center_to_corner = self.size / 2
            shift_amount = (center_to_corner - offset_to_corner) * axis_mask
            side_translation = rotate(
                point=shift_amount,
                rotation=self.center.rotation,
            )
            doubled_sides.append(side + side_translation)
            doubled_sides.append(side - side_translation)
        return doubled_sides

    def fetch_outer_corners(self):
        return self.fetch_double_outer_sides(offset_to_corner=0)

    @property
    def translation(self):
        return self.center.translation

    @property
    def rotation(self):
        return self.center.rotation

    @property
    def is_border(self):
        return self.parent_matrix.mount_is_border(
            row_idx=self.row_idx, col_idx=self.col_idx
        )

    @property
    def next_border_mount(self):
        return self.parent_matrix.next_border_mount(
            row_idx=self.row_idx, col_idx=self.col_idx
        )

    @property
    def previous_border_mount(self):
        return self.parent_matrix.previous_border_mount(
            row_idx=self.row_idx, col_idx=self.col_idx
        )

    def __repr__(self):
        return (
            f"KeyMount( \n"
            f"idx: ({self.row_idx}, {self.col_idx})\n"
            f"position: t:{self.center.rotation.vector.tolist()} "
            f"r:{self.center.rotation.vector.tolist()}\n"
            f"size: {self.size.vector.tolist()}\n"
            f"is_border: {self.is_border}"
        )


class XYZVector(object):
    def __init__(self, x_comp, y_comp, z_comp):
        self.vector = np.array([x_comp, y_comp, z_comp], dtype=np.float64)

    @classmethod
    def from_vector(cls, other):
        assert len(other) == 3
        return cls(other[X], other[Y], other[Z])

    @property
    def x_comp(self):
        return self.vector[X]

    @property
    def y_comp(self):
        return self.vector[Y]

    @property
    def z_comp(self):
        return self.vector[Z]

    def __add__(self, other):
        assert len(other) <= 3
        return self.vector + other.vector

    def __sub__(self, other):
        assert len(other) <= 3
        return self.vector - other.vector

    def __mul__(self, other):
        assert len(other) <= 3
        return self.vector * other.vector

    def __truediv__(self, other):
        assert len(other) <= 3
        return self.vector / other.vector

    def __pow__(self, other):
        assert len(other) <= 3
        return self.vector ** other.vector

    def __len__(self):
        return len(self.vector)

    def __repr__(self):
        return f"x: {self.x_comp}, y: {self.y_comp}, z: {self.z_comp}"

    __radd__ = __add__
    __rsub__ = __sub__
    __mul__ = __mul__
    __truediv__ = __truediv__


class Size(XYZVector):
    def __init__(self, size_x, size_y, size_z):
        super().__init__(size_x, size_y, size_z)

    @property
    def size_x(self):
        return self.x_comp

    @property
    def size_y(self):
        return self.y_comp

    @property
    def size_z(self):
        return self.z_comp

    def __repr__(self):
        return (f"size_x: {self.size_x},"
                f"size_y: {self.size_y},"
                f"size_z: {self.size_z}")


class Position(object):
    def __init__(self, rotation, translation):
        if rotation is None:
            self.rotation = XYZVector(0, 0, 0)
        else:
            self.rotation = XYZVector.from_vector(rotation)
        if translation is None:
            self.translation = XYZVector(0, 0, 0)
        else:
            self.translation = XYZVector.from_vector(translation)

    @classmethod
    def from_transform(cls, transformations):
        translation = fetch_translation(transformations)
        rotation = fetch_rotation(transformations)
        return cls(rotation=rotation, translation=translation)

    def __add__(self, other):
        if isinstance(other, Position):
            return self.translation + other.translation
        elif len(other) <= 3:
            return self.translation + other
        raise TypeError

    def __sub__(self, other):
        if isinstance(other, Position):
            return self.translation - other.translation
        elif len(other) <= 3:
            return self.translation - other
        raise TypeError

    def __repr__(self):
        return (
            f"translation: {self.translation.vector}, "
            f"rotation: {self.rotation.vector}"
        )

    __radd__ = __add__
    __rsub__ = __sub__


class JoinMethod(object):
    def join():
        raise NotImplementedError


class Junction(object):
    def __init__(self):
        self.components = []
        self.join_method = None


class Wall(Junction):
    pass
