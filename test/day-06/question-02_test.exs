defmodule Day6Question2Test do
  use ExUnit.Case

  describe "work/1" do
    test "returns the proper answer for the actual inputs" do
      assert Day6Question2.work("./lib/day-06/input.txt") == 3596
    end
  end
end
