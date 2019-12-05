require "../../src/2/first.cr"

describe FlightComputer do
  it "adds and multiplies things" do
    FlightComputer.run([1, 0, 0, 0, 99]).should eq [2, 0, 0, 0, 99]
    FlightComputer.run([2,3,0,3,99]).should eq [2, 3, 0, 6, 99]
    FlightComputer.run([2,4,4,5,99,0]).should eq [2,4,4,5,99,9801]
    FlightComputer.run([1,1,1,4,99,5,6,0,99]).should eq [30,1,1,4,2,5,6,0,99]
  end

  it "multiplies long things" do
    FlightComputer.run(File.read("#{__DIR__}/input.txt").split(',').map(&.to_i))[0].should eq 12490719
  end
end