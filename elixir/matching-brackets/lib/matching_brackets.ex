defmodule MatchingBrackets do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """

  @possible_brackets ["[", "]", "(", ")", "{", "}"]

  @spec check_brackets(String.t()) :: boolean
  def check_brackets(str) do
  	stack = String.graphemes(str)
  	        |> Enum.filter(fn bracket -> bracket in @possible_brackets end)
  	        |> Enum.reduce_while([], &update_stack(&2, &1))
  	
  	stack == []
  end

  defp update_stack(stack, char) when char in ["[", "(", "{"], do: {:cont, [char | stack]}
  defp update_stack([hd | tl], "]") when hd == "[", do: {:cont, tl}
  defp update_stack([hd | tl], "}") when hd == "{", do: {:cont, tl}
  defp update_stack([hd | tl], ")") when hd == "(", do: {:cont, tl}
  defp update_stack([hd | _tl], _), do: {:halt, [hd]}
  defp update_stack([], char), do: {:halt, [char]}
end
