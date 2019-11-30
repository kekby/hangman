defmodule Dictionary do
  alias Dictionary.WordList

  defdelegate start(), to: WordList
  defdelegate random_word(word), to: WordList

end
