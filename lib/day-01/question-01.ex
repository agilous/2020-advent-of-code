defmodule Day1Question1 do
  def pair_product([h | [ht | _]]) do
    h * ht
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

  def work(path) do
    {:ok, contents} = File.read(path)

    String.split(contents, "\n", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> pairs()
    |> Enum.map(&pair_product/1)
  end
end
