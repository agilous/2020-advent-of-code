defmodule Day7Question1 do
  def color_count([], _, acc), do: acc
  def color_count(_, [], acc), do: acc
  def color_count(rules, colors, acc) do
    matched_rules = rules
                    |> Enum.reject(&Regex.match?(~r/contain no other bag/, &1))
                    |> Enum.filter(&Regex.match?(~r/contain.*#{Enum.join(colors, "|")} bag/, &1))
    new_rules = Enum.reject(rules, fn(x) -> Enum.member?(matched_rules, x) end)
    new_colors = new_colors_from_rules(matched_rules)
    color_count(new_rules, new_colors, acc + Enum.count(matched_rules))
  end

  def new_colors_from_rules(matched_rules) do
    matched_rules
    |> Enum.map(&Regex.run(~r/\b(.*)\sbags contain/, &1))
    |> Enum.map(&Enum.take(&1, -1))
    |> Enum.map(&hd/1)
  end

  def work(path) do
    {:ok, contents} = File.read(path)
    String.split(contents, "\n", trim: true)
    |> color_count(["shiny gold"], 0)
  end
end
