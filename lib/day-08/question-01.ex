defmodule Day8Question1 do
  def load(pointer, instructions, accumulator, called_lines) do
    case Enum.member?(called_lines, pointer) do
      true -> accumulator
      false ->
        instruction = pointer |> execute(instructions)
        case operation(instruction) do
          "acc" -> load(pointer + 1, instructions, accumulator + value(instruction), called_lines ++ [pointer])
          "jmp" -> load(pointer + value(instruction), instructions, accumulator, called_lines ++ [pointer])
          "nop" -> load(pointer + 1, instructions, accumulator, called_lines ++ [pointer])
        end
    end
  end

  def execute(pointer, instructions) do
    instructions
    |> Enum.filter(fn({_, p}) -> p == pointer end)
    |> hd()
    |> elem(0)
  end

  def operation(instruction) do
    Regex.run(~r/^(acc|jmp|nop)/, instruction) |> Enum.take(-1) |> hd()
  end

  def run(program) do
    instructions = program |> Enum.with_index()

    load(0, instructions, 0, [])
  end

  def value(instruction) do
    Regex.run(~r/\s+((\+|\-)?\d+)$/, instruction)
    |> Enum.take(2)
    |> Enum.take(-1)
    |> hd()
    |> String.to_integer()
  end

  def work(path) do
    {:ok, contents} = File.read(path)
    String.split(contents, "\n", trim: true)
    |> run()
  end
end
