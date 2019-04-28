defmodule Roman do
	@symbols [
		{"M",  1000},
		{"CM", 900},
		{"D",  500},
		{"CD", 400},
		{"C",  100},
		{"XC", 90},
		{"L",  50},
		{"XL", 40},
		{"X",  10},
		{"IX", 9},
		{"V",  5},
		{"IV", 4},
		{"I",  1},
	]

  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t()
  def numerals(number) do
  	{result, 0} = @symbols
  	|> Enum.reduce({"", number}, &translate/2)

  	result
  end

  defp translate({symbol, value}, {result, number}) do
  	new = symbol |> String.duplicate(Integer.floor_div(number, value))
  	{result <> new, Integer.mod(number, value)}
  end

end
