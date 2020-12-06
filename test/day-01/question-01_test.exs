defmodule Day1Question1Test do
  use ExUnit.Case

  describe "work/1" do
    test "returns the proper answer for the test inputs" do
      assert Day1Question1.work("./test/support/files/day-01/test_input.txt") == [514579]
    end

    test "returns the proper answer for the actual inputs" do
      assert Day1Question1.work("./lib/day-01/input.txt") == [440979]
    end
  end
end
