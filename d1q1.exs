defmodule Day1Question1 do
  def sum_first_with_each_of_tail([]) do
    nil
  end

  def sum_first_with_each_of_tail([_ | nil]) do
    nil
  end

  def sum_first_with_each_of_tail([head | tail]) do
    Enum.each(tail, fn(x) -> if head + x == 2020 do IO.puts("#{head} & #{x}") end; end)
    sum_first_with_each_of_tail(tail)
  end

  def work() do
    {:ok, contents} = '/Users/bbarnett/Dropbox/src/agilous/advent-of-code/2020/day-1/question-1/input.txt'
                      |> File.read()

    list_of_nums = String.split(contents, "\n", trim: true)
                   |> Enum.map(&String.to_integer/1)

    sum_first_with_each_of_tail(list_of_nums)
  end
end

Day1Question1.work()
