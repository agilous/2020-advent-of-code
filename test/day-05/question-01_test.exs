defmodule Day5Question1Test do
  use ExUnit.Case

  describe "seat_id/1" do
    test "returns the calculated seat ID" do
      assert Day5Question1.seat_id("FBFBBFFRLR") == 357
    end
  end

  describe "work/1" do
    test "returns the proper answer for the actual inputs" do
      assert Day5Question1.work("./lib/day-05/input.txt") == 888
    end
  end
end
