defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t()
  def numerals(number) do
    convert(number)
  end

  defp convert(number), do: convert(number, "")
  defp convert(0, roman_value), do: roman_value
  defp convert(number, roman_value) do
    #Get the symbol representation for the highest position
    {symbol, value} = Enum.filter(romans(), fn({_symbol, value}) ->
      number >= value
    end) |> List.last

    #Get quotient (to convert to roman) and reminter (carry to next iteration)
    {roman_count, next} = {div(number, value), rem(number, value)}
    string_symbol = Atom.to_string(symbol)

    #Concat n times te current symbol
    roman_value = roman_value <> Enum.reduce(1..roman_count,"", fn(_value, acc) ->  acc <> string_symbol end) |> String.upcase

    #recursive call
    convert(next, roman_value)
  end


  defp romans do
    [
      i:            1,
      iv:           4,
      v:            5,
      ix:           9,
      x:            10,
      xl:           40,
      l:            50,
      xc:           90,
      c:            100,
      cd:           400,
      d:            500,
      cm:           900,
      m:           1000
    ]
  end
end
