defmodule Day4Question1Test do
  use ExUnit.Case

  describe "work/1" do
    test "returns the proper answer for the test inputs" do
      assert Day4Question1.work("./test/support/files/day-04/test_input.txt") == 2
    end

    test "returns the proper answer for the actual inputs" do
      assert Day4Question1.work("./lib/day-04/input.txt") == 260
    end
  end
end
