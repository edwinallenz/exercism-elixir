defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence |> String.downcase |> String.split(~r{(*UTF)(_|[^\w-])+}) |> words_in_list(%{})
  end

  #recursive counting
  def words_in_list([], map), do: map
  def words_in_list([head | tail], map) do
    element_map  = case Map.has_key?(map, head) do
                     true -> %{head => map[head] + 1 }
                     false -> %{head => 1}
                   end
    words_in_list(tail, Map.merge(map, element_map))
  end
end
