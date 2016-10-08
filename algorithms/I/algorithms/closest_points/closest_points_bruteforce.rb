require_relative 'point'
require 'pry'

def closest_points_bruteforce(points)
  i = -1
  j = -1
  min_distance = Float::INFINITY

  while i < points.size-1
    i += 1
    j = i
    while j < points.size-1
      j += 1

      a = points[i] 
      b = points[j] 
      distance = a.distance(b)
      min_distance = distance if distance < min_distance
    end
  end
  min_distance
end
