module RocketFuel
  class FuelCalculator
    include Iterator(Int64)
    def initialize(@mass = 0_i64); end
    def next
      @mass = @mass./(3).to_i64.-(2)
      @mass > 0 ? @mass : stop
    end
  end

  def self.total_sum(arr)
    arr.sum { |initial| FuelCalculator.new(initial).sum }
  end
end