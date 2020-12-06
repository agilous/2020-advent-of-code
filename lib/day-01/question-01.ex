defmodule Day1Question1 do
  def pair_product([h | [ht | _]]) do
    IO.puts("#{h} X #{ht} = #{h * ht}")
  end

  def pairs([]) do
    []
  end

  def pairs([_ | nil]) do
    []
  end

  def pairs([head | tail]) do
    successes = tail
                |> Enum.filter(fn(x) -> head + x == 2020 end)
                |> Enum.map(fn(x) -> [head, x] end)

    successes ++ pairs(tail)
  end

  def work() do
    {:ok, contents} = File.read("./lib/day-01/input.txt")

    String.split(contents, "\n", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> pairs()
    |> Enum.map(&pair_product/1)
  end
end

Day1Question1.work()
