defmodule ElWc do
  @moduledoc """
  This module count words in files
  """

  @doc """
    Start file worts counter
  """
  @spec run :: :file_not_found | non_neg_integer()
  def run do
    filename =
      "File to count the words from: "
      |> IO.gets()
      |> String.trim()

    count_words(File.exists?(filename), filename)
  end

  @type result :: :file_not_found | non_neg_integer()
  @spec count_words(exists? :: boolean(), binary()) :: result()
  defp count_words(true, filename) do
    File.stream!(filename)
    |> Flow.from_enumerable()
    |> Flow.flat_map(&String.split(&1, " "))
    |> Flow.partition()
    |> Enum.count()
  end

  defp count_words(false, _) do
    :file_not_found
  end
end
