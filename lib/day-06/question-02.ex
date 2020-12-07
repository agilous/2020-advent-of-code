defmodule Day6Question2 do
  def group_count(data) do
    responder_count = data |> String.split("\n") |> Enum.count()
    sorted_graphemes = data |> String.replace("\n", "") |> String.graphemes() |> Enum.sort()
    sorted_string = sorted_graphemes |> Enum.join()

    sorted_graphemes
    |> Enum.uniq
    |> Enum.filter(fn(x) -> Regex.match?(~r/#{x}{#{responder_count}}/, sorted_string) end)
    |> Enum.count()
  end

  def sum_of_counts(data) do
    data
    |> Enum.map(&group_count/1)
    |> Enum.sum()
  end

  def work(path) do
    {:ok, contents} = File.read(path)
    String.split(contents, "\n\n", trim: true)
    |> sum_of_counts()
  end
end
