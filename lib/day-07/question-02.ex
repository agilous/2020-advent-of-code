defmodule Day7Question2 do
  def contained_bags(rules, color) do
    rules
    |> rule_for(color)
    |> get_bags_with_counts()
  end

  def empty_bag?(rules, color) do
    rules
    |> Enum.filter(&Regex.match?(~r/^#{color}/, &1))
    |> hd()
    |> (fn(x) -> Regex.match?(~r/contain no other bags/, x) end).()
  end

  def get_bags_with_counts(rule) do
    rule
    |> String.split(" contain ")
    |> Enum.take(-1)
    |> hd()
    |> String.split(",")
    |> Enum.map(&Regex.run(~r/(\d+)\b(.*)\bbag/, &1))
    |> Enum.map(&Enum.take(&1, -2))
    |> Enum.map(&process_pair(&1))
  end

  def internal_bag_count(rules, color) do
    case empty_bag?(rules, color) do
      true -> 0
      false ->
        bag_counts = contained_bags(rules, color)
        bag_counts
        |> Enum.map(&product(&1, rules))
        |> Enum.sum()
        |> Kernel.+(bag_counts |> Enum.map(&hd(&1)) |> Enum.sum())
    end
  end

  def process_pair([count, color]) do
    [String.to_integer(count), String.trim(color)]
  end

  def product([count, color], rules) do
    count * internal_bag_count(rules, color)
  end

  def rule_for(rules, color) do
    rules
    |> Enum.filter(&Regex.match?(~r/^#{color}/, &1))
    |> hd()
  end

  def work(rules, color) when is_list(rules) do
    internal_bag_count(rules, color)
  end
  def work(rules, color) when is_binary(rules) do
    {:ok, contents} = File.read(rules)
    String.split(contents, "\n", trim: true)
    |> internal_bag_count(color)
  end
end
