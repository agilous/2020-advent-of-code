# 2020 Advent of Code
My "solutions" such as they are for the [2020 Advent of Code](https://adventofcode.com/2020).

## Getting Started
```sh
git clone git@github.com:agilous/2020-advent-of-code.git
cd 2020-advent-of-code
asdf install # Or your version manager of preference.
mix test
```
Then run individual files to see results:
```sh
elixir lib/day-01/question-01.ex
# --OR--
mix run lib/day-01/question-01.ex
```

## Benchmarks
Benchmarks provided via [Benchee](https://hex.pm/packages/benchee):
```sh
mix run test/benchmark.exs
```