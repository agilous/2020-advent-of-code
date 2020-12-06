defmodule Day1Question2Test do
  use ExUnit.Case

  describe "work/1" do
    test "returns the proper answer for the test inputs" do
      assert Day1Question2.work("./test/support/files/day-01/test_input.txt") == [241861950]
    end

    test "returns the proper answer for the actual inputs" do
      assert Day1Question2.work("./lib/day-01/input.txt") == [82498112]
    end
  end
end
