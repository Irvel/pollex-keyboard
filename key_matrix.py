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


def rotate(point, angle_list):
    # angle_list is x y z angles
    # Force a column vector
    point = np.array(point).reshape((3, 1))

    theta_x = np.radians(angle_list[0])
    x_rot_mat = [[1.0,                0.0,                 0.0],
                 [0.0,    np.cos(theta_x),    -np.sin(theta_x)],
                 [0.0,    np.sin(theta_x),     np.cos(theta_x)]]
    x_rot_mat = np.array(x_rot_mat)

    theta_y = np.radians(angle_list[1])
    y_rot_mat = [[np.cos(theta_y),     0.0,     np.sin(theta_y)],
                 [0.0,                 1.0,                 0.0],
                 [-np.sin(theta_y),    0.0,     np.cos(theta_y)]]
    y_rot_mat = np.array(y_rot_mat)

    theta_z = np.radians(angle_list[2])
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


def get_side_position(center_position, size, side_type):
    sign_map = {
        #         X   Y  Z
        "up":    [0,  1, 0],
        "down":  [0, -1, 0],
        "left":  [-1, 0, 0],
        "right": [1,  0, 0],
    }
    side_sign = np.array(sign_map[side_type])
    corner_translation = (size / 2) * side_sign
    return center_position + corner_translation


class SwitchMatrix(object):
    def __init__(self, pykeeb_matrix):
        self.num_rows = pykeeb_matrix.rows
        self.num_columns = pykeeb_matrix.columns
        assert self.num_rows <= 3
        assert self.num_columns <= 5
        self.wall_thickness = pykeeb_matrix.wall_thickness
        self.pykeeb_matrix = pykeeb_matrix
        self.border_mounts = collections.OrderedDict()
        self.extract_switch_matrix()

    def remove_pykeeb_walls(self):
        pass

    def extract_switch_mounts(self):
        self.mount_matrix = [[] for _ in self.num_rows]
        for row_idx, row in enumerate(self.pykeeb_matrix.sm):
            for col_idx, pykeeb_switch_mount in enumerate(row):
                is_border = self.mount_is_border(row_idx, col_idx)
                keymount = KeyMount(
                    switch_mount=pykeeb_switch_mount,
                    parent_matrix=self,
                    row_idx=row_idx,
                    col_idx=col_idx,
                )
                self.mount_matrix.append(keymount)
                if is_border:
                    self.border_mounts[(row_idx, col_idx)] = keymount

    def mount_is_border(self, row_idx, col_idx):
        is_row_border = row_idx == (self.num_rows - 1)
        is_col_border = col_idx == (self.num_columns - 1)
        return is_row_border or is_col_border

    def next_border_mount(self, row_idx, col_idx):
        assert self.mount_is_border(row_idx, col_idx)
        border_indices = list(self.border_mounts.keys())
        current_idx = border_indices.index((row_idx, col_idx))
        if current_idx == len(border_indices) - 1:
            next_idx = 0
        else:
            next_idx = current_idx + 1
        next_mount_key = border_indices[next_idx]
        return self.border_mounts(next_mount_key)

    def previous_border_mount(self, row_idx, col_idx):
        assert self.mount_is_border(row_idx, col_idx)
        border_indices = list(self.border_mounts.keys())
        current_idx = border_indices.index((row_idx, col_idx))
        if current_idx == 0:
            previous_idx = len(border_indices) - 1
        else:
            previous_idx = current_idx - 1
        previous_mount_key = border_indices[previous_idx]
        return self.border_mounts(previous_mount_key)


class KeyMount(object):
    def __init__(self, switch_mount, parent_matrix, row_idx, col_idx):
        self._row_idx = row_idx
        self._col_idx = col_idx
        self.center = Position.from_transform(switch_mount.transformations)
        self.size = Size(
            size_x=switch_mount.mount_length,
            size_y=switch_mount.mount_width,
            size_z=switch_mount.thickness
        )
        self.openscad_solid = switch_mount.switch_mount
        self.parent_matrix = parent_matrix
        self.walls = []

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
            side_type="up_side"
        )

    @property
    def down_side(self):
        return get_side_position(
            center_position=self.center,
            size=self.size,
            side_type="down_side"
        )

    @property
    def left_side(self):
        return get_side_position(
            center_position=self.center,
            size=self.size,
            side_type="left_side"
        )

    @property
    def right_side(self):
        return get_side_position(
            center=self.center,
            size=self.size,
            side_type="right_side"
        )

    @property
    def translation(self):
        return self.center.translation

    @property
    def rotation(self):
        return self.center.rotation

    @property
    def is_border(self):
        return self.parent_matrix.mount_is_border(
            row_idx=self._row_idx, col_idx=self._col_idx
        )

    @property
    def next_border_mount(self):
        return self.parent_matrix.next_border_mount(
            row_idx=self._row_idx, col_idx=self._col_idx
        )

    @property
    def previous_border_mount(self):
        return self.parent_matrix.previous_border_mount(
            row_idx=self._row_idx, col_idx=self._col_idx
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
