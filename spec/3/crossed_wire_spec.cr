require "../../src/3/first"
require "spec"

describe CrossedWires do
  it "calculates distances and steps" do
    input = File.read_lines("#{__DIR__}/input.txt")
      .map(&.split(',').map {|e| {e[0], e[1..].to_i} })
    pp CrossedWires.solve(input)
  end
end