defmodule School do
  @moduledoc """
  Simulate students in a school.

  Each student is in a grade.
  """

  @doc """
  Add a student to a particular grade in school.
  """
  @spec add(map, String.t, integer) :: map
  def add(db, name, grade) do
    student_list = Map.get(db, grade, [])
    student_list = [name | student_list]
    Map.put(db, grade, student_list)
  end

  @doc """
  Return the names of the students in a particular grade.
  """
  @spec grade(map, integer) :: [String.t]
  def grade(db, grade) do
    Map.get(db, grade, [])
  end

  @doc """
  Sorts the school by grade and name.
  """
  @spec sort(map) :: [{integer, [String.t]}]
  def sort(db) do
    Enum.reduce(Map.keys(db), %{}, fn (item, state) ->
      student_list = Map.get(db, item) |> Enum.sort
      Map.put(state, item, student_list) 
    end)
    |> Enum.sort
  end
end