defmodule Day3Question1 do
  def position(index) do
    index * 3 |> rem(31)
  end

  def tree_at_position?({row, index}) do
    Regex.match?(~r/^\S{#{position(index)}}(#)/, row)
  end

  def trees_encountered(grid) do
    trees = grid
            |> Enum.with_index(0)
            |> Enum.filter(&tree_at_position?/1)
            |> Enum.count()
    IO.puts "#{trees} encountered."
  end

  def work() do
    {:ok, contents} = File.read('./day-03/input.txt')

    String.split(contents, "\n", trim: true)
    |> trees_encountered()
  end
end

Day3Question1.work()
