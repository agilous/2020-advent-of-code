defmodule Day1Question2 do
  def pair_product([h | [ht | _]]) do
    h * ht
  end

  def pair_product(_) do
    nil
  end

  def pairs([]) do
    nil
  end

  def pairs([_ | nil]) do
    nil
  end

  def pairs([head | tail]) do
    successes = tail
                |> Enum.filter(fn(x) -> head + x == 2020 end)
                |> Enum.map(fn(x) -> [head, x] end)

    successes ++ pairs(tail)
  end

  def work() do
    {:ok, contents} = '/Users/bbarnett/Dropbox/src/agilous/advent-of-code/2020/day-1/question-1/input.txt'
                      |> File.read()

    String.split(contents, "\n", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> pairs()
    |> IO.inspect()
    |> Enum.map(&Day1Question2.pair_product/1)
  end
end

Day1Question2.work()
