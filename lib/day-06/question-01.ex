defmodule Day6Question1 do
  def group_count(data) do
    data |> String.replace("\n", "") |> String.graphemes() |> Enum.uniq() |> Enum.count()
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
