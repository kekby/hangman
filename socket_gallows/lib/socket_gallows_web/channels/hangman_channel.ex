defmodule SocketGallowsWeb.HangmanChannel do
  require Logger
  use Phoenix.Channel

  def join("hangman:game", _, socket) do
    game = Hangman.new_game()
    socket = assign(socket, :game, game)
    start_timer()
    { :ok, socket }
  end

  def handle_in("tally", _, socket) do
    game = socket.assigns.game
    tally = Hangman.tally(game)
    push(socket, "tally", tally)
    { :noreply, socket }
  end

  def handle_in("make_move", guess, socket) do
    tally = socket.assigns.game |> Hangman.make_move(guess)
    push(socket, "tally", tally)
    { :noreply, socket }
  end

  def handle_in("new_game", _, socket) do
    socket = socket |> assign(:game, Hangman.new_game())
    handle_in("tally", nil, socket)
  end

  def handle_in(message, _, socket) do
    Logger.error("Invalid message: #{message}")
    { :noreply, socket }
  end


  def handle_info({ :tick, 0 }, socket) do
    game = socket.assigns.game
    tally = Hangman.tally(game)
    push(socket, "tally", %{ tally | game_state: :time_run_out })
    { :noreply, socket}
  end

  def handle_info({ :tick, seconds_left }, socket) do
    tick(seconds_left - 1)
    push(socket, "seconds_left", %{ seconds_left: seconds_left })
    { :noreply, socket}
  end

  defp start_timer() do
    tick(5)
  end

  defp start_timer(seconds) do
    Process.send_after(self(), { :tick, seconds}, 1000)
  end

  defp tick(seconds), do: Process.send_after(self(), { :tick, seconds }, 1000)
end
