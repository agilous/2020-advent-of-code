defmodule Day7Question1Test do
  use ExUnit.Case

  describe "new_colors_from_rules/1" do
    test "returns a list of colors" do
      rules = [
        "plaid crimson bags contain 3 shiny gold bags, 3 plaid gray bags.",
        "muted olive bags contain 2 plaid black bags, 3 shiny gold bags, 4 vibrant crimson bags.",
        "shiny salmon bags contain 3 light silver bags, 3 faded orange bags, 3 dim tomato bags, 3 shiny gold bags.",
        "dark gray bags contain 2 bright green bags, 5 light blue bags, 3 light tan bags, 2 shiny gold bags.",
        "pale olive bags contain 2 shiny gold bags, 3 posh bronze bags, 4 bright tomato bags, 2 bright olive bags.",
        "posh cyan bags contain 3 dim tomato bags, 4 pale crimson bags, 4 shiny gold bags.",
        "vibrant indigo bags contain 3 drab coral bags, 2 plaid green bags, 4 shiny gold bags, 3 wavy coral bags.",
        "wavy fuchsia bags contain 2 muted silver bags, 2 shiny gold bags."
      ]

      assert Day7Question1.new_colors_from_rules(rules) == ["plaid crimson", "muted olive", "shiny salmon", "dark gray", "pale olive", "posh cyan", "vibrant indigo", "wavy fuchsia"]
    end
  end

  describe "work/1" do
    test "returns the proper answer for the actual inputs" do
      assert Day7Question1.work("./lib/day-07/input.txt") == 257
    end
  end
end
