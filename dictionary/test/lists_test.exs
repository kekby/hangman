defmodule ListsTest do
  use ExUnit.Case
  doctest Lists

  test "should return true in empty list" do
    assert Lists.even_length?([]) == true
  end

  test "should return false in odd list" do
    assert Lists.even_length?([1, 2, 3]) == false
  end

  test "should return true in even list" do
    assert Lists.even_length?([1, 2]) == true
  end
end
