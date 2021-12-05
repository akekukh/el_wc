defmodule ElWc do
  @spec run :: :file_not_found | non_neg_integer()
  def run do
    filename = IO.gets("File to count the words from: ") |> String.trim()
    count_words(filename, %{is_file_exist: File.exists?(filename)})
  end

  defp count_words(filename, %{is_file_exist: true}) do
    File.stream!(filename)
    |> Flow.from_enumerable()
    |> Flow.flat_map(&String.split(&1, " "))
    |> Flow.partition()
    |> Enum.count()
  end

  defp count_words(_, %{is_file_exist: false}) do
    :file_not_found
  end
end
