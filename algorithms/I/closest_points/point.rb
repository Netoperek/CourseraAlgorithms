class Point
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end
  
  def distance(point)
    raise 'pass an instance of Point class' unless point.is_a? Point
    return Math.sqrt((@x-point.x)**2 + (@y-point.y)**2)
  end
end
