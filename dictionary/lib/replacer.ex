defmodule Replacer do
  def replace({ a, b }) do
    {b, a}
  end

  def checker(a, a) do
    true
  end

  def checker(_, _) do
    false
  end
end
