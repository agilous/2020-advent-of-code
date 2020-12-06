defmodule Day3Question2Test do
  use ExUnit.Case

  describe "position/2" do
    test "returns correct answer for 3:1 slope" do
      slope = [right: 3, down: 1]
      row = "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"

      assert Day3Question2.position({row, 0}, slope) == 0
      assert Day3Question2.position({row, 1}, slope) == 3
      assert Day3Question2.position({row, 10}, slope) == 30
      assert Day3Question2.position({row, 11}, slope) == 2
      assert Day3Question2.position({row, 20}, slope) == 29
      assert Day3Question2.position({row, 21}, slope) == 1
    end

    test "returns correct answer for 1:2 slope" do
      slope = [right: 1, down: 2]
      row = "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"

      assert Day3Question2.position({row, 0}, slope) == 0
      assert Day3Question2.position({row, 2}, slope) == 1
      assert Day3Question2.position({row, 60}, slope) == 30
      assert Day3Question2.position({row, 62}, slope) == 0
      assert Day3Question2.position({row, 122}, slope) == 30
      assert Day3Question2.position({row, 124}, slope) == 0
    end
  end

  describe "tree_at_position?/2" do
    test "returns correct answers for 1:1 slope" do
      slope = [right: 1, down: 1]
      row_0   = "#.............................."
      row_1   = ".#............................."
      row_30  = "..............................#"
      row_31  = "#.............................."
      row_61  = "..............................#"
      row_62  = "#.............................."

      assert Day3Question2.tree_at_position?({row_0, 0}, slope) == false
      assert Day3Question2.tree_at_position?({row_1, 1}, slope) == true
      assert Day3Question2.tree_at_position?({row_30, 30}, slope) == true
      assert Day3Question2.tree_at_position?({row_31, 31}, slope) == true
      assert Day3Question2.tree_at_position?({row_61, 61}, slope) == true
      assert Day3Question2.tree_at_position?({row_62, 62}, slope) == true
    end

    test "returns correct answer for 3:1 slope" do
      slope = [right: 3, down: 1]
      row_0  = "#.............................."
      row_1  = "...#..........................."
      row_10 = "..............................#"
      row_11 = "..#............................"
      row_20 = ".............................#."
      row_21 = ".#............................."

      assert Day3Question2.tree_at_position?({row_0, 0}, slope) == false
      assert Day3Question2.tree_at_position?({row_1, 1}, slope) == true
      assert Day3Question2.tree_at_position?({row_10, 10}, slope) == true
      assert Day3Question2.tree_at_position?({row_11, 11}, slope) == true
      assert Day3Question2.tree_at_position?({row_20, 20}, slope) == true
      assert Day3Question2.tree_at_position?({row_21, 21}, slope) == true
    end

    test "returns correct answer for 1:2 slope" do
      slope = [right: 1, down: 2]
      row_0  = "#.............................."
      row_1  = "###############################"
      row_2  = ".#............................."
      row_3  = "###############################"
      row_60 = "..............................#"
      row_61 = "###############################"
      row_62 = "#.............................."
      row_63 = "###############################"

      assert Day3Question2.tree_at_position?({row_0, 0}, slope) == false
      assert Day3Question2.tree_at_position?({row_1, 1}, slope) == false
      assert Day3Question2.tree_at_position?({row_2, 2}, slope) == true
      assert Day3Question2.tree_at_position?({row_3, 3}, slope) == false
      assert Day3Question2.tree_at_position?({row_60, 60}, slope) == true
      assert Day3Question2.tree_at_position?({row_61, 61}, slope) == false
      assert Day3Question2.tree_at_position?({row_62, 62}, slope) == true
      assert Day3Question2.tree_at_position?({row_63, 63}, slope) == false
    end
  end

  describe "work/1" do
    test "returns the proper answer for the test inputs" do
      assert Day3Question2.work("./test/support/files/day-03/test_input.txt") == 336
    end

    test "returns the proper answer for the actual inputs" do
      assert Day3Question2.work("./lib/day-03/input.txt") < 7_056_402_024 # 1st Failure!
      assert Day3Question2.work("./lib/day-03/input.txt") > 2_529_949_920 # 2nd Failure!
      assert Day3Question2.work("./lib/day-03/input.txt") != 4_295_201_232 # 3rd Failure!
      assert Day3Question2.work("./lib/day-03/input.txt") == 5_522_401_584
    end
  end
end
