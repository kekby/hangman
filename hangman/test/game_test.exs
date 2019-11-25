defmodule GameTest do
  use ExUnit.Case
  alias Hangman.Game

  test "new_game returns structure" do
    game = Game.new_game()

    assert game.turns_left == 7
    assert game.game_state == :initializing
    assert length(game.letters) > 0
  end

  test "each letter of a list is lowecase" do
    game = Game.new_game()

    assert Enum.all?(game.letters, &(String.match?(&1, ~r/[a-z]/))) == true
  end
end
