defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @letter_scores %{
          'a': 1,
          'e': 1,
          'i': 1,
          'o': 1,
          'u': 1,
          'l': 1,
          'n': 1,
          'r': 1,
          's': 1,
          't': 1,
          'd': 2,
          'g': 2,
          'b': 3,
          'c': 3,
          'm': 3,
          'p': 3,
          'f': 4,
          'h': 4,
          'v': 4,
          'w': 4,
          'y': 4,
          'k': 5,
          'j': 8,
          'x': 8,
          'q': 10,
          'z': 10,
        }

  @spec score(String.t) :: non_neg_integer
  def score(word) do
    word
    |> String.downcase
    |> String.strip
    |> String.codepoints
    |> Enum.map(fn(letter) -> Map.get(@letter_scores, String.to_atom(letter)) end)
    |> Enum.reduce(0, fn(x, acc) -> acc + x end)
  end
end

