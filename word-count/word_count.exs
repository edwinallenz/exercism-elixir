defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence |> String.downcase |> String.split(~r{(*UTF)(_|[^\w-])+}) |> words_in_list
  end

  # defp words_in_list(words) do
  #   Enum.reduce(words, %{}, fn(word, map) ->
  #     Map.update(map, word, 1, fn(current_value) -> current_value + 1 end)
  #   end)
  # end

  def words_in_list([], map), do: map
  def words_in_list([head | tail], map \\ %{}) do
    updated_map = Map.update(map, head, 1, &(&1 + 1))
    words_in_list(tail, updated_map)
  end
end
