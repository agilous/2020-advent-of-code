defmodule Day4Question2 do
  def birth_year(passport) do
    case Regex.run(~r/\bbyr:(\d{4})\b/, passport) do
      [_, str] ->
        String.to_integer(str)
      _ ->
        0
    end
  end

  def expiration_year(passport) do
    case Regex.run(~r/\beyr:(\d{4})\b/, passport) do
      [_, str] ->
        String.to_integer(str)
      _ ->
        0
    end
  end

  def height(passport) do
    case Regex.run(~r/\bhgt:(\d{2,3})(cm|in)\b/, passport) do
    [_, str, unit] ->
      [String.to_integer(str), unit]
    _ ->
      nil
    end
  end

  def issue_year(passport) do
    case Regex.run(~r/\biyr:(\d{4})\b/, passport) do
      [_, str] ->
        String.to_integer(str)
      _ ->
        0
    end
  end

  def valid_birth_year?(passport) do
    birth_year = birth_year(passport)
    birth_year >= 1920 && birth_year <= 2002
  end

  def valid_expiration_year?(passport) do
    expiration_year = expiration_year(passport)
    expiration_year >= 2020 && expiration_year <= 2030
  end

  def valid_eye_color?(passport) do
    Regex.match?(~r/\becl:(amb|blu|brn|gry|grn|hzl|oth)\b/, passport)
  end

  def valid_hair_color?(passport) do
    Regex.match?(~r/\bhcl:(#[0-9a-f]{6})\b/, passport)
  end

  def valid_height?(passport) do
    case height(passport) do
      [value, "cm"] ->
        value >= 150 && value <= 193
      [value, "in"] ->
        value >= 59 && value <= 76
      _ ->
        false
    end
  end

  def valid_issue_year?(passport) do
    issue_year = issue_year(passport)
    issue_year >= 2010 && issue_year <= 2020
  end

  def valid_passport_id?(passport) do
    Regex.match?(~r/\bpid:(\d{9})\b/, passport)
  end

  def valid_passports(passports) do
    passports
    |> Enum.filter(&valid_passport_id?/1)
    |> Enum.filter(&valid_hair_color?/1)
    |> Enum.filter(&valid_eye_color?/1)
    |> Enum.filter(&valid_birth_year?/1)
    |> Enum.filter(&valid_expiration_year?/1)
    |> Enum.filter(&valid_issue_year?/1)
    |> Enum.filter(&valid_height?/1)
    |> Enum.count()
  end

  def work(path) do
    {:ok, contents} = File.read(path)
    String.split(contents, "\n\n", trim: true)
    |> valid_passports()
  end
end
