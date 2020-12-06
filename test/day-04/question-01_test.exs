defmodule Day4Question1Test do
  use ExUnit.Case

  describe "valid_passports/1" do
    test "returns the proper answer for the test inputs" do
      {:ok, contents} = File.read("./test/support/files/day-04/test_input.txt")
      passports = String.split(contents, "\n\n", trim: true)

      assert Day4Question1.valid_passports(passports) == 2
    end

    test "returns the proper answer for the actual inputs" do
      {:ok, contents} = File.read("./lib/day-04/input.txt")
      passports = String.split(contents, "\n\n", trim: true)

      assert Day4Question1.valid_passports(passports) == 260
    end
  end
end
