require "../../src/1/first.cr"
require "../../src/1/second.cr"

describe RocketFuel do
  it "calculates simple fuel requirements" do
    RocketFuel.sum(File.read_lines("#{__DIR__}/input.txt").map(&.to_i64)).should eq 3266516
  end

  it "calculates total fuel requirements" do
    RocketFuel.total_sum(File.read_lines("#{__DIR__}/input.txt").map(&.to_i64)).should eq 4896902
  end
end