defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """

  def remove_punctuation(sentence) do
    String.replace(sentence, ~r/[!@,:%&\$\^]/ , "")
  end

  def replace_underscores(sentence) do
    String.replace(sentence, ~r/[_]/ , " ")
  end

  @spec count(String.t) :: map
  def count(sentence) do
    sentence 
      |> remove_punctuation 
      |> replace_underscores 
      |> String.downcase  
      |> String.split 
      |> 
      Enum.reduce(%{}, fn(word, wordmap) -> 
        if Map.has_key?(wordmap, word) do
          value = Map.get(wordmap, word)
          value = value + 1
          Map.put(wordmap, word, value)
        else
          Map.put(wordmap, word, 1)
        end
      end)
  end
end