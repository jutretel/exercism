defmodule PigLatin do
  @vowel_regex ~r{^[aeiou]|^y[^aeiou]|^x[^aeiou]}
  @consonant_regex ~r{^([^aeiou]*qu|[^aeiou]+)*}

  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split()
    |> Enum.map(&translate_word/1)
    |> Enum.join(" ")
  end

  defp translate_word(word) do
    cond do
      String.match?(word, @vowel_regex) -> word <> "ay"
      true -> translate_consonant_word(word)
    end
  end

  defp translate_consonant_word(word) do
    [beginning] = Regex.run(@consonant_regex, word, capture: :first)
    String.replace(word, beginning, "") <> beginning <> "ay"
  end
end
