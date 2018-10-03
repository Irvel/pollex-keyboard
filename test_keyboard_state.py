import keyboard_state
import numpy as np
import pytest


def test_rotates_to_same_spot():
    point = np.array([1, 2, 5])
    same_spot_rotation = [360, -360, 0]
    rotated_point = keyboard_state.rotate(
        point=point,
        rotation=same_spot_rotation
    )
    np.testing.assert_array_almost_equal(rotated_point, point)


def test_does_not_rotate():
    point = np.array([12, -14, 5.2])
    no_rotation = [0, 0, 0]
    rotated_point = keyboard_state.rotate(
        point=point,
        rotation=no_rotation
    )
    np.testing.assert_array_almost_equal(rotated_point, point)


def test_x_270_rotate():
    # Test 270° x-axis rotation: (x, y, z) --> (x, z, -y)
    #          (x remains fixed)  ^             ^
    x, y, z = [.21, -123.2, 11.5]
    initial_point = np.array([x, y, z])
    expected_point = np.array([x, z, -y])

    x_270_rotation = [270, 0, 0]
    rotated_point = keyboard_state.rotate(
        point=initial_point,
        rotation=x_270_rotation
    )
    np.testing.assert_array_almost_equal(rotated_point, expected_point)


def test_y_270_rotate():
    # Test 270° y-axis rotation: (x, y, z) --> (-z, y, x)
    #          (y remains fixed)     ^              ^
    x, y, z = [.21, -123.2, 11.5]
    initial_point = np.array([x, y, z])
    expected_point = np.array([-z, y, x])

    y_270_rotation = [0, 270, 0]
    rotated_point = keyboard_state.rotate(
        point=initial_point,
        rotation=y_270_rotation
    )
    np.testing.assert_array_almost_equal(rotated_point, expected_point)


def test_wrong_dimensions_rotate():
    hyper_point = [1, 2, 5, 4]
    normal_vector = [0, 0, 0]
    with pytest.raises(AssertionError):
        keyboard_state.rotate(point=hyper_point, rotation=normal_vector)

    with pytest.raises(AssertionError):
        keyboard_state.rotate(point=normal_vector, rotation=hyper_point)

    with pytest.raises(AssertionError):
        keyboard_state.rotate(point=hyper_point, rotation=hyper_point)


def test_up_left_corner():
    # up_left
    #   ⌄
    # 6|************
    #  |*          *
    #  |*          *
    # 3|*    •     *
    #  |*          *
    #  |*          *
    #  |************
    #  |------------ x
    #  0     3     6
    #  y
    center = np.array([3, 3, 0])
    size = np.array([6, 6, 0])
    expected_position = np.array([0, 6, 0])
    actual_position = keyboard_state.get_corner_position(
        center_position=center,
        size=size,
        corner_type="up_left"
    )
    np.testing.assert_array_almost_equal(
        actual_position, expected_position
    )


def test_up_right_corner():
    # up_right
    #              ⌄
    # 8|************
    #  |*          *
    #  |*          *
    # 4|*    •     *
    #  |*          *
    #  |*          *
    #  |************
    #  |------------ x
    #  0     4     8
    #  y
    center = np.array([4, 4, 0])
    size = np.array([8, 8, 0])
    expected_position = np.array([8, 8, 0])
    actual_position = keyboard_state.get_corner_position(
        center_position=center,
        size=size,
        corner_type="up_right"
    )
    np.testing.assert_array_almost_equal(
        actual_position, expected_position
    )


def test_down_left_corner():
    # down_left
    #
    # 2|************
    #  |*          *
    #  |*          *
    # 1|*    •     *
    #  |*          *
    #  |*          *
    # >|************
    #  |------------ x
    #  0     1     2
    #  y
    center = np.array([1, 1, 0])
    size = np.array([2, 2, 0])
    expected_position = np.array([0, 0, 0])
    actual_position = keyboard_state.get_corner_position(
        center_position=center,
        size=size,
        corner_type="down_left"
    )
    np.testing.assert_array_almost_equal(
        actual_position, expected_position
    )


def test_down_right_corner():
    # down_right
    #
    # 6|************
    #  |*          *
    #  |*          *
    # 3|*    •     *
    #  |*          *
    #  |*          *
    #  |************<------------
    #  |------------ x
    #  0     3     6
    #  y
    center = np.array([3, 3, 0])
    size = np.array([6, 6, 0])
    expected_position = np.array([6, 0, 0])
    actual_position = keyboard_state.get_corner_position(
        center_position=center,
        size=size,
        corner_type="down_right"
    )
    np.testing.assert_array_almost_equal(
        actual_position, expected_position
    )


def test_right_size():
    # right
    #
    # 62|************
    #   |*          *
    #   |*          *
    # 31|*    •     *<------------
    #   |*          *
    #   |*          *
    #   |************
    #   |------------ x
    #   0     31   62
    #  y
    center = np.array([31, 31, 0])
    size = np.array([62, 62, 0])
    expected_position = np.array([62, 31, 0])
    actual_position = keyboard_state.get_side_position(
        center_position=center,
        size=size,
        side_type="right"
    )
    np.testing.assert_array_almost_equal(
        actual_position, expected_position
    )


def test_side_unrotated_plane():
    unrotated_plane = np.array([0, 0, 0])
    expected_z = 40.24
    center = np.array([231, 131, expected_z])
    position = keyboard_state.Position(rotation=unrotated_plane,
                                       translation=center)
    size = np.array([362, 362, 0])
    actual_position = keyboard_state.get_side_position(
        center_position=position,
        size=size,
        side_type="right"
    )
    assert expected_z == actual_position.translation.z_comp


def test_side_rotated_plane():
    vertical_rotation = np.array([0, 90, 0])
    x = .5
    y = .5
    center = np.array([x, y, 10])
    position = keyboard_state.Position(rotation=vertical_rotation,
                                       translation=center)
    size = np.array([1, 1, 0])
    actual_position = keyboard_state.get_side_position(
        center_position=position,
        size=size,
        side_type="right"
    )
    assert x == actual_position.translation.x_comp
    assert y == actual_position.translation.y_comp


def test_is_top_left_border():
    # rows = 4
    # columns 6
    # pos = (0, 0)
    #   0 1 2 3 4 5
    # 0 •
    # 1
    # 2
    # 3
    rows = 4
    columns = 6
    row_idx, col_idx = (0, 0)
    assert keyboard_state.is_matrix_border(
        num_rows=rows,
        num_columns=columns,
        row_idx=row_idx,
        col_idx=col_idx,
    )


def test_is_middle_border():
    # rows = 4
    # columns 6
    # pos = (1, 2)
    #   0 1 2 3 4 5
    # 0
    # 1     •
    # 2
    # 3
    rows = 4
    columns = 6
    row_idx, col_idx = (1, 2)
    assert not keyboard_state.is_matrix_border(
        num_rows=rows,
        num_columns=columns,
        row_idx=row_idx,
        col_idx=col_idx,
    )


def test_is_bottom_right_border():
    # rows = 4
    # columns 6
    # pos = (3, 5)
    #   0 1 2 3 4 5
    # 0
    # 1
    # 2
    # 3           •
    rows = 4
    columns = 6
    row_idx, col_idx = (3, 5)
    assert keyboard_state.is_matrix_border(
        num_rows=rows,
        num_columns=columns,
        row_idx=row_idx,
        col_idx=col_idx,
    )


def test_simulate_clockwise_path():
    num_rows = 4
    num_columns = 4
    expected_path = [
        (0, 0), (0, 1), (0, 2), (0, 3),
        (1, 3), (2, 3), (3, 3), (3, 2),
        (3, 1), (3, 0), (2, 0), (1, 0),
    ]
    actual_path = keyboard_state.simulate_clockwise_path(
        num_rows=num_rows, num_columns=num_columns
    )
    print(actual_path)
    assert actual_path == expected_path


def test_simulate_small_clockwise_path():
    num_rows = 2
    num_columns = 2
    expected_path = [
        (0, 0), (0, 1), (1, 1), (1, 0)
    ]
    actual_path = keyboard_state.simulate_clockwise_path(
        num_rows=num_rows, num_columns=num_columns
    )
    print(actual_path)
    assert actual_path == expected_path


def test_refuses_no_grid_clockwise_path():
    num_rows = 1
    num_columns = 2

    with pytest.raises(AssertionError):
        keyboard_state.simulate_clockwise_path(
            num_rows=num_rows, num_columns=num_columns
        )
