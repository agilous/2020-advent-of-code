defmodule Day7Question2Test do
  use ExUnit.Case

  setup do
    rules =  [
      "psycheldelic pink bags contain 2 funky blue bags, 3 ultra violet bags.",
      "funky blue bags contain 5 dark green bags.",
      "dark green bags contain no other bags.",
      "ultra violet bags contain no other bags."
    ]

    {:ok, %{rules: rules}}
  end

  describe "empty_bag?/2" do
    test "returns true when the bag of the given color contains no other bags, false otherwise", %{rules: rules} do
      assert Day7Question2.empty_bag?(rules, "ultra violet")
      refute Day7Question2.empty_bag?(rules, "funky blue")
    end
  end

  describe "get_bags_with_counts/1" do
    test "returns a list of bags contained in the given rule with associated counts" do
      rule = "psycheldelic pink bags contain 2 funky blue bags, 3 ultra violet bags."
      assert Day7Question2.get_bags_with_counts(rule) == [[2, "funky blue"], [3, "ultra violet"]]
    end
  end

  describe "work/2" do
    test "returns the proper answer for trivial inputs" do
      rules_01 = [
        "light red bags contain 1 bright white bag.",
        "bright white bags contain no other bags."
      ]
      assert Day7Question2.work(rules_01, "light red") == 1

      rules_02 = [
        "light red bags contain 1 bright white bag, 3 dim brown bags.",
        "bright white bags contain no other bags.",
        "dim brown bags contain no other bags."
      ]
      assert Day7Question2.work(rules_02, "light red") == 4
    end

    test "returns the proper answer for the test inputs from Part 1" do
      assert Day7Question2.work("./test/support/files/day-07/test_input-part-01.txt", "shiny gold") == 32
    end

    test "returns the proper answer for the test inputs" do
      assert Day7Question2.work("./test/support/files/day-07/test_input.txt", "shiny gold") == 126
    end

    test "returns the proper answer for the actual inputs" do
      assert Day7Question2.work("./lib/day-07/input.txt", "shiny gold") == 1038
    end
  end
end
