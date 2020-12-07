Benchee.run(
  %{
    "lib/day-01/question-01.ex" => fn -> Day1Question1.work("./lib/day-01/input.txt") end,
    "lib/day-01/question-02.ex" => fn -> Day1Question2.work("./lib/day-01/input.txt") end,
    "lib/day-02/question-01.ex" => fn -> Day2Question1.work() end,
    "lib/day-02/question-02.ex" => fn -> Day2Question2.work() end,
    "lib/day-03/question-01.ex" => fn -> Day3Question1.work() end,
    "lib/day-03/question-02.ex" => fn -> Day3Question2.work("./lib/day-03/input.txt") end,
    "lib/day-04/question-01.ex" => fn -> Day4Question1.work("./lib/day-04/input.txt") end,
    "lib/day-04/question-02.ex" => fn -> Day4Question2.work("./lib/day-04/input.txt") end,
    "lib/day-05/question-01.ex" => fn -> Day5Question1.work("./lib/day-05/input.txt") end,
    "lib/day-05/question-02.ex" => fn -> Day5Question2.work("./lib/day-05/input.txt") end,
    "lib/day-06/question-01.ex" => fn -> Day6Question1.work("./lib/day-06/input.txt") end,
    "lib/day-06/question-02.ex" => fn -> Day6Question2.work("./lib/day-06/input.txt") end,
    "lib/day-07/question-01.ex" => fn -> Day7Question1.work("./lib/day-07/input.txt") end
  }
)
