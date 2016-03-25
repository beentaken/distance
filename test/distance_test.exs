defmodule DistanceTest do
  use ExUnit.Case
  doctest Distance

  test "calculate distance between two points" do
    assert_in_delta Distance.distance({0, 0}, {0.5, 0.5}), 0.707, 0.001
    assert_in_delta Distance.distance({0, 1}, {1, 0}), 1.414, 0.001
    assert_in_delta Distance.distance({2.5, 2.5}, {4, 0.8}), 2.267, 0.001
    assert_in_delta Distance.distance({2.5, 3.1}, {2.5, 3.1}), 0, 0.001
  end

  test "calculate square distance between two points" do
    assert Distance.distance_squared({0, 0}, {0.5, 0.5}) == 0.5
    assert Distance.distance_squared({0, 0}, {0.5, 0.5}) == 0.5
    assert Distance.distance_squared({0, 1}, {1, 0}) == 2
    assert Distance.distance_squared({2.5, 2.5}, {4, 0.8}) == 5.14
    assert Distance.distance_squared({2.5, 3.1}, {2.5, 3.1}) == 0
  end

  test "calculate distance between a point and a line segment" do
    assert_in_delta Distance.segment_distance({0.5, 0.5}, {0, 0}, {1, 0}), 0.5, 0.001
    assert_in_delta Distance.segment_distance({0.5, 0.5}, {0, 0}, {-1, 0}), 0.707, 0.001
    assert_in_delta Distance.segment_distance({0.5, 0.5}, {-1, 0}, {0, 0}), 0.707, 0.001
    assert_in_delta Distance.segment_distance({0.5, 0.5}, {0, 0}, {0, 0}), 0.707, 0.001

    assert_in_delta Distance.segment_distance({7, 1}, {-2, 1}, {5, 1}), 2, 0.001
    assert_in_delta Distance.segment_distance({17, 1}, {-2, 1}, {5, 1}), 12, 0.001
    assert_in_delta Distance.segment_distance({3, 1}, {-2, 1}, {5, 1}), 0, 0.001
    assert_in_delta Distance.segment_distance({-2, 1}, {-2, 1}, {5, 1}), 0, 0.001
    assert_in_delta Distance.segment_distance({5, 1}, {-2, 1}, {5, 1}), 0, 0.001
    assert_in_delta Distance.segment_distance({3, 3}, {-2, 1}, {5, 1}), 2, 0.001
    assert_in_delta Distance.segment_distance({3, -1}, {-2, 1}, {5, 1}), 2, 0.001
    assert_in_delta Distance.segment_distance({-2, -1}, {-2, 1}, {5, 1}), 2, 0.001

    assert_in_delta Distance.segment_distance({7, 1}, {-2, 1}, {-2, 5}), 9, 0.001
    assert_in_delta Distance.segment_distance({17, 1}, {-2, 1}, {-2, 5}), 19, 0.001
    assert_in_delta Distance.segment_distance({-2, 3}, {-2, 1}, {-2, 5}), 0, 0.001
    assert_in_delta Distance.segment_distance({-2, 1}, {-2, 1}, {-2, 5}), 0, 0.001
    assert_in_delta Distance.segment_distance({-2, 5}, {-2, 1}, {-2, 5}), 0, 0.001
    assert_in_delta Distance.segment_distance({3, 3}, {-2, 1}, {-2, 5}), 5, 0.001
    assert_in_delta Distance.segment_distance({2, 1}, {-2, 1}, {-2, 5}), 4, 0.001
    assert_in_delta Distance.segment_distance({-2, -1}, {-2, 1}, {-2, 5}), 2, 0.001

    assert_in_delta Distance.segment_distance({7, 1}, {-2, 1}, {-2, 1}), 9, 0.001
    assert_in_delta Distance.segment_distance({17, 1}, {-2, 1}, {-2, 1}), 19, 0.001
    assert_in_delta Distance.segment_distance({-2, 3}, {-2, 1}, {-2, 1}), 2, 0.001
  end

  test "calculate sqaure distance between a point and a line segment" do
    assert Distance.segment_distance_squared({0.5, 0.5}, {0, 0}, {1, 0}) == 0.5 * 0.5
    assert Distance.segment_distance_squared({0.5, 0.5}, {0, 0}, {-1, 0}) == 0.5
    assert Distance.segment_distance_squared({0.5, 0.5}, {-1, 0}, {0, 0}) == 0.5
    assert Distance.segment_distance_squared({0.5, 0.5}, {0, 0}, {0, 0}) == 0.5
  end
end