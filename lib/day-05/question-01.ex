defmodule Day5Question1 do
  def column_number(column_part) do
    case column_part
           |> String.replace("L", "0")
           |> String.replace("R", "1")
           |> Integer.parse(2) do
      {value, _} ->
        value
      _ ->
        0
    end
  end

  def highest_seat_id(seat_codes) do
    seat_codes
    |> Enum.max_by(&seat_id/1)
    |> seat_id()
  end

  def row_number(row_part) do
    case row_part
           |> String.replace("F", "0")
           |> String.replace("B", "1")
           |> Integer.parse(2) do
      {value, _} ->
        value
      _ ->
        0
    end
  end

  def seat_id(seat_code) do
    {row_part, column_part} = String.split_at(seat_code, 7)
    row_number(row_part) * 8 + column_number(column_part)
  end

  def work(path) do
    {:ok, contents} = File.read(path)
    String.split(contents, "\n", trim: true)
    |> highest_seat_id()
  end
end
