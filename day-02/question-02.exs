defmodule Day2Question2 do
  def at_both?(graphemes, p1, p2, char) do
    graphemes |> Enum.at(p1) == char && graphemes |> Enum.at(p2) == char
  end

  def invalid_passwords(password_array) do
    count = password_array
            |> Enum.filter(&password_valid?/1)
            |> Enum.count()
    IO.puts("#{count} valid passwords.")
  end

  def password_valid?(row) do
    [policy, password] = String.split(row, ":", trim: true)
    [p1_p2, char] = String.split(policy, " ", trim: true)
    [p1, p2] = String.split(p1_p2, "-", trim: true) |> Enum.map(fn(x) -> String.to_integer(x) - 1 end)
    graphemes = password |> String.trim() |> String.graphemes()
    (position_one_only?(graphemes, p1, p2, char) || position_two_only?(graphemes, p1, p2, char)) && !at_both?(graphemes, p1, p2, char)
  end

  def position_one_only?(graphemes, p1, p2, char) do
    graphemes |> Enum.at(p1) == char && graphemes |> Enum.at(p2) != char
  end

  def position_two_only?(graphemes, p1, p2, char) do
    graphemes |> Enum.at(p1) != char && graphemes |> Enum.at(p2) == char
  end

  def work() do
    {:ok, contents} = File.read('./day-02/input.txt')

    String.split(contents, "\n", trim: true)
    |> invalid_passwords()
  end
end

Day2Question2.work()
