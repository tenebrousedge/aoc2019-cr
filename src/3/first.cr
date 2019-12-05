module CrossedWires
  DIRECTIONS = {'R' => [1, 0], 'L' => [-1, 0], 'U' => [0, 1], 'D' => [0, -1]}
  record Segment, direction : Char, length : Int32

  struct Point
    property x : Int32, y : Int32

    def initialize(@x, @y); end
  end

  struct Wire
    alias PointGrid = Hash(Point, Int32)
    getter points : PointGrid
    forward_missing_to @points

    def initialize(@segments : Array(Segment))
      @points = points
    end

    def points
      current = Point.new(0, 0)
      count = 0
      @segments.each_with_object(PointGrid.new) do |segment, memo|
        offset_x, offset_y = DIRECTIONS[segment.direction]
        (0...segment.length).each do
          current.x += offset_x
          current.y += offset_y
          count += 1
          memo[current] = count
        end
      end
    end

    def crossings(other : Wire)
      points.keys & other.points.keys
    end
  end

  def self.solve(wiredata)
    one, two = wiredata.map { |wire| Wire.new(wire.map(&->Segment.new(Char, Int32))) }
    crossings = one.crossings(two)
    distance = crossings.min_of { |c| c.x.abs + c.y.abs }
    steps = crossings.min_of { |c| one[c] + two[c] }
    { distance, steps }
  end
end
