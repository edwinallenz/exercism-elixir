defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """

  @romans [M: 1000, CM: 900, D: 500, CD: 400, C: 100, XC: 90, L: 50, XL: 40, X: 10, IX: 9, V: 5, IV: 4, I: 1]

  @spec numerals(pos_integer) :: String.t()
  def numerals(number) do
    numerals(number, @romans, "")
  end

  defp numerals(0, _romans, roman) do
    roman
  end

  defp numerals(number,[{_simbol, value} | tail], roman) when number < value  do
    numerals(number, tail, roman)
  end

  defp numerals(number, [{symbol, value} | _tail], roman) do
    numerals(number - value, @romans, roman <> Atom.to_string(symbol))
  end
end
