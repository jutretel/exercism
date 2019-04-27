defmodule RNATranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
  	Enum.map(dna, &transcribe/1)
  end

  defp transcribe(?A), do: ?U
  defp transcribe(?C), do: ?G
  defp transcribe(?T), do: ?A
  defp transcribe(?G), do: ?C

end
