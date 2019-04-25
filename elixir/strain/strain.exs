defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun) do
    Enum.reduce(list, [], &put_if(&1, &2, fun, true))
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun) do
    Enum.reduce(list, [], &put_if(&1, &2, fun, false))
  end

  @spec put_if(item :: any, list :: list(any), fun :: (any -> boolean), expected :: boolean) :: list(any)
  defp put_if(item, list, fun, expected) do
    if fun.(item) == expected do
      list ++ [item]
    else
      list
    end
  end
end
