defmodule Day5Question2Test do
  use ExUnit.Case

  describe "work/1" do
    test "returns the proper answer for the actual inputs" do
      assert Day5Question2.work("./lib/day-05/input.txt") == 522
    end
  end
end
