defmodule ReplacerTest do
  use ExUnit.Case
  doctest Replacer

  test "Should return true if parameters are equal" do
    assert Replacer.checker(2, 2) == true
  end

  test "Should return false if parameters are not equal" do
    assert Replacer.checker(2, 3) == false
  end
end
