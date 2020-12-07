defmodule Day6Question1Test do
  use ExUnit.Case

  describe "work/1" do
    test "returns the proper answer for the actual inputs" do
      assert Day6Question1.work("./lib/day-06/input.txt") == 6782
    end
  end
end
