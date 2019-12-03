require "./first"

input = File.read("#{__DIR__}/../../spec/2/input.txt").split(',').map(&.to_i)
pp (0..99).to_a.product((0..99).to_a).find {|noun, verb|
  program = input.dup
  program[1..2] = [noun, verb]
  FlightComputer.run(program)[0] == 19690720
}

# {20, 3}