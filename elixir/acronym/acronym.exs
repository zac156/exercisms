# defmodule Acronym do
#   @doc """
#   Generate an acronym from a string.
#   "This is a string" => "TIAS"
#   """
#   @spec abbreviate(String.t()) :: String.t()
#   def abbreviate(string) do
#     string
#     |> String.replace(",", "")
#     |> String.replace("-", "")
#     |> String.split(" ")
#     |> Enum.map(&make_capital(&1))
#     |> Enum.map(&find_capitals(&1))
#     |> Enum.join
#   end

#   def make_capital(word) do
#     {first_letter, remaining} = String.split_at(word, 1)
#     first_letter = first_letter |> String.upcase
#     first_letter <> remaining
#   end

#   def find_capitals(word) do
#     word
#     |> String.codepoints
#     |> Enum.filter(fn(l) -> String.upcase(l) == l end)
#     |> Enum.join
#   end
# end


defmodule Acronym do
  def abbreviate(string) do
    string
    |> String.codepoints
    |> Enum.reduce({"", true}, fn 
      " ", {output, _boundary} ->
        {output, true}
      char, {output, true} ->
        {output <> char, false}
      char, {output, boundary} ->
        if String.upcase(char) == char do
          {output <> char, boundary}
        else
          {output, boundary}
        end
    end)
    |> elem(0)
  end
end

IO.inspect Acronym.abbreviate("HyperText Transfer Protocol")