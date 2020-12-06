defmodule Day4Question2Test do
  use ExUnit.Case

  setup do
    passport = "pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1980\nhcl:#623a2f"
    {:ok, passport: passport}
  end

  describe "birth_year?/1" do
    test "returns integer value of the birth year", state do
      assert Day4Question2.birth_year(state[:passport]) == 1980
    end
  end

  describe "expiration_year?/1" do
    test "returns integer value of the expiration year", state do
      assert Day4Question2.expiration_year(state[:passport]) == 2030
    end
  end

  describe "height?/1" do
    test "returns a list containing the integer value and unit of the height", state do
      assert Day4Question2.height(state[:passport]) == [74, "in"]
    end
  end

  describe "valid_birth_year?/1" do
    test "returns true for values between 1920-2002 inclusive, false otherwise", state do
      assert Day4Question2.valid_birth_year?(state[:passport])
      refute Day4Question2.valid_birth_year?(String.replace(state[:passport], "byr:1980", "byr:1919"))
      refute Day4Question2.valid_birth_year?(String.replace(state[:passport], "byr:1980", "byr:2003"))
    end
  end

  describe "valid_expiration_year?/1" do
    test "returns true for values between 2020-2030 inclusive, false otherwise", state do
      assert Day4Question2.valid_expiration_year?(state[:passport])
      refute Day4Question2.valid_expiration_year?(String.replace(state[:passport], "eyr:2030", "eyr:2019"))
      refute Day4Question2.valid_expiration_year?(String.replace(state[:passport], "eyr:2030", "eyr:2031"))
    end
  end

  describe "valid_eye_color?/1" do
    test "returns true for values equal to 'amb', 'blu', 'brn', 'gry', 'grn', 'hzl' or 'oth', false otherwise", state do
      assert Day4Question2.valid_eye_color?(state[:passport])
      assert Day4Question2.valid_eye_color?(String.replace(state[:passport], "ecl:grn", "ecl:amb"))
      assert Day4Question2.valid_eye_color?(String.replace(state[:passport], "ecl:grn", "ecl:amb"))
      assert Day4Question2.valid_eye_color?(String.replace(state[:passport], "ecl:grn", "ecl:blu"))
      assert Day4Question2.valid_eye_color?(String.replace(state[:passport], "ecl:grn", "ecl:brn"))
      assert Day4Question2.valid_eye_color?(String.replace(state[:passport], "ecl:grn", "ecl:gry"))
      assert Day4Question2.valid_eye_color?(String.replace(state[:passport], "ecl:grn", "ecl:hzl"))
      assert Day4Question2.valid_eye_color?(String.replace(state[:passport], "ecl:grn", "ecl:oth"))
      refute Day4Question2.valid_eye_color?(String.replace(state[:passport], "ecl:grn", "ecl:grn1"))
    end
  end

  describe "valid_hair_color?/1" do
    test "returns true for six digit hexadecimal values preceeded by a '#', false otherwise", state do
      assert Day4Question2.valid_hair_color?(state[:passport])
      refute Day4Question2.valid_hair_color?(String.replace(state[:passport], "hcl:#623a2f", "hcl:#623a2f1"))
      refute Day4Question2.valid_hair_color?(String.replace(state[:passport], "hcl:#623a2f", "hcl:#623a2"))
      refute Day4Question2.valid_hair_color?(String.replace(state[:passport], "hcl:#623a2f", "hcl:#623a2g"))
    end
  end

  describe "valid_height?/1" do
    test "returns true for values between 59-76in (150-193cm) inclusive, false otherwise", state do
      assert Day4Question2.valid_height?(state[:passport])
      refute Day4Question2.valid_height?(String.replace(state[:passport], "hgt:74in", "hgt:58in"))
      refute Day4Question2.valid_height?(String.replace(state[:passport], "hgt:74in", "hgt:77in"))
      refute Day4Question2.valid_height?(String.replace(state[:passport], "hgt:74in", "hgt:149cm"))
      refute Day4Question2.valid_height?(String.replace(state[:passport], "hgt:74in", "hgt:194cm"))
    end
  end

  describe "valid_issue_year?/1" do
    test "returns true for values between 2010-2020 inclusive, false otherwise", state do
      assert Day4Question2.valid_issue_year?(state[:passport])
      refute Day4Question2.valid_issue_year?(String.replace(state[:passport], "iyr:2012", "iyr:2009"))
      refute Day4Question2.valid_issue_year?(String.replace(state[:passport], "iyr:2012", "iyr:2021"))
    end
  end

  describe "work/1" do
    test "returns the proper answer for valid test inputs" do
      assert Day4Question2.work("./test/support/files/day-04/test_valid_passports.txt") == 4
      assert Day4Question2.work("./test/support/files/day-04/test_invalid_passports.txt") == 0
    end

    test "returns the proper answer for the actual inputs" do
      assert Day4Question2.work("./lib/day-04/input.txt") > 107 # 1st failure!
      assert Day4Question2.work("./lib/day-04/input.txt") == 153
    end
  end
end
