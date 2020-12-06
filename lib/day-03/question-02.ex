defmodule Day3Question2 do
  def position({row, row_index}, slope) do
    row_length = String.length(row)
    if slope[:right] >= slope[:down] do
      rem((row_index * slope[:right]), row_length)
    else
      rem(Kernel.div(row_index, slope[:down]), row_length)
    end
  end

  def single_run(slope, grid) do
    grid
    |> trees_encountered(slope)
  end

  def tree_at_position?({_, 0}, _), do: false
  def tree_at_position?({row, row_index}, slope) do
    if rem(row_index, slope[:down]) == 0 do
      Regex.match?(~r/^\S{#{position({row, row_index}, slope)}}(#)/, row)
    else
      false
    end
  end

  def trees_encountered(grid, slope) do
    grid
    |> Enum.with_index(0)
    |> Enum.filter(&(tree_at_position?(&1, slope)))
    |> Enum.count()
  end

  def work(path) do
    {:ok, contents} = File.read(path)
    grid = String.split(contents, "\n", trim: true)

    runs = [
             [right: 1, down: 1],
             [right: 3, down: 1],
             [right: 5, down: 1],
             [right: 7, down: 1],
             [right: 1, down: 2]
           ]

    Enum.map(runs, &(single_run(&1, grid)))
    |> Enum.reduce(fn(x, acc) -> x * acc end)
  end
end

Day3Question2.work("./lib/day-03/input.txt")
|> IO.puts()
