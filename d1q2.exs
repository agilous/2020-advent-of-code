defmodule Day1Question2 do
  def pairs([], _, _), do: []
  def pairs([_ | nil], _, _), do: []
  def pairs([head | tail], target, first) do
    successes = tail
                |> Enum.filter(fn(x) -> head + x == target end)
                |> Enum.map(fn(x) -> [first, head, x] end)

    successes ++ pairs(tail, target, first)
  end

  def triplets([]), do: []
  def triplets([head | tail]) do
    target = 2020 - head
    pairs(tail, target, head) ++ triplets(tail)
  end

  def triplet_product([a, b, c]) do
    IO.puts("#{a} X #{b} X #{c} = #{a * b * c}")
  end

  def work() do
    {:ok, contents} = 'day-1/question-1/input.txt'
                      |> File.read()

    String.split(contents, "\n", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> triplets()
    |> Enum.map(&triplet_product/1)
  end
end

Day1Question2.work()
