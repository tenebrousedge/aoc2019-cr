module RocketFuel
  def self.sum(arr)
    arr.sum &./(3).floor.to_i64.-(2)
  end
end