defmodule Day2Question1 do
  def password_valid?(row) do
    [policy, password] = String.split(row, ":", trim: true)
    [min_max, char] = String.split(policy, " ", trim: true)
    [min, max] = String.split(min_max, "-", trim: true)
    count = Regex.scan(~r/#{char}/, password) |> Enum.count()
    count >= String.to_integer(min) && count <= String.to_integer(max)
  end

  def invalid_passwords(password_array) do
    count = password_array
            |> Enum.filter(&password_valid?/1)
            |> Enum.count()
    IO.puts("#{count} invalid passwords.")
  end

  def work() do
    {:ok, contents} = File.read('./day-02/input.txt')

    String.split(contents, "\n", trim: true)
    |> invalid_passwords()
  end
end

Day2Question1.work()
