require_relative 'point'
require_relative 'closest_points_bruteforce'
require_relative 'closest_points'
require "test/unit"
require "pry"
require "set"
 
class TestClosestPoints < Test::Unit::TestCase
  POINTS = [ 
    Point.new(-3, 5),
    Point.new(-3,-3),
    Point.new(-2, 0),
    Point.new(3, -2),
    Point.new(4, -5),
    Point.new(0, 2),
    Point.new(4, 5),
    Point.new(1, 3)
  ]

  def random_points(size)
    set_x = Set.new
    set_y = Set.new
    points = []
    size.times do
      while true do
       x = (1..1000).to_a.sample 

       unless set_x.include? x
        set_x.add x
        break
       end
      end

      while true do
       y = (1..1000).to_a.sample 
       unless set_y.include? y
        set_y.add y
        break
       end
      end

      point = Point.new(x, y)
      points.push(point)
    end
    points.uniq
  end

  def test_distance
    a = Point.new(1,2)
    b = Point.new(2,3)
    assert_equal(Math.sqrt(2), a.distance(b))
    assert_equal(Math.sqrt(2), b.distance(a))

    a = Point.new(21, 34)
    b = Point.new(123,153)
    assert_equal(Math.sqrt(24565), b.distance(a))
  end

  def test_bruteforce
    assert_equal(Math.sqrt(2), closest_points_bruteforce(POINTS))
  end

  def test_closest_points_split
    points = POINTS.sort_by { |point| point.y }
    assert_equal(Math.sqrt(10), closest_points_split(points, 1000))
  end

  def test_closest_points
    #assert_equal(Math.sqrt(2), closest_points(POINTS))

    points = random_points(1000)
    puts 'finished randomizing'
    points.push(Point.new(1, 3))
    points.push(Point.new(1, 2))
    assert_equal(1.0, closest_points(points))
  end
end
