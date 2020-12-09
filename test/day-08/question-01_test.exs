defmodule Day8Question1Test do
  use ExUnit.Case

  describe "operation/1" do
    test "returns the operation part of the given instruction" do
      instruction = "acc -99"
      assert Day8Question1.operation(instruction) == "acc"
    end
  end

  describe "value/1" do
    test "returns the value part of the given instruction" do
      assert Day8Question1.value("acc +9") == 9
      assert Day8Question1.value("acc +99") == 99
      assert Day8Question1.value("acc +999") == 999
      assert Day8Question1.value("acc -9") == -9
      assert Day8Question1.value("acc -999") == -999
    end
  end

  describe "work/1" do
    test "returns the proper answer for the test inputs" do
      assert Day8Question1.work("./test/support/files/day-08/test_input.txt") == 5
    end

    test "returns the proper answer for the actual inputs" do
      assert Day8Question1.work("./lib/day-08/input.txt") == 1134
    end
  end
end
