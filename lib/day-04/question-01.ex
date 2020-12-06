defmodule Day4Question1 do
  def key_list(passport) do
    ["byr", "cid", "ecl", "eyr", "hgt", "hcl", "iyr", "pid"]
    |> Enum.filter(&Regex.match?(~r/\b#{&1}:/, passport))
  end

  def valid?(passport) do
    valid_keys = [
      ["byr", "cid", "ecl", "eyr", "hgt", "hcl", "iyr", "pid"],
      ["byr", "ecl", "eyr", "hgt", "hcl", "iyr", "pid"]
    ]
    Enum.member?(valid_keys, key_list(passport))
  end

  def valid_passports(passports) do
    passports
    |> Enum.filter(&valid?/1)
    |> Enum.count()
  end

  def work(path) do
    {:ok, contents} = File.read(path)
    String.split(contents, "\n\n", trim: true)
    |> valid_passports()
  end
end

# Day4Question1.work("./lib/day-04/input.txt")
# |> IO.puts()
