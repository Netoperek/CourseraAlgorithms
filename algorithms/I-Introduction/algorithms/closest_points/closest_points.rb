require 'pry'

$x = 0
$y = 0

def closest_points(points)
  points_y_sorted = points.sort_by { |point| point.y }
  closest_points_recurssive(points_y_sorted)
end

def closest_points_recurssive(points)
  if points.size < 4
    min_distance = Float::INFINITY
    i = 0
    j = 0
    while i < points.size
      j = i + 1
      while j < points.size
        a = points[i]   
        b = points[j]   
        distance = a.distance(b)
        min_distance = distance if distance < min_distance
        j += 1
      end
      i += 1
    end
    return min_distance
  end

  left_distance = closest_points(points[0..points.size/2-1])
  right_distance = closest_points(points[points.size/2..points.size])
  delta = [left_distance, right_distance].min

  all_distance = closest_points_split(points, delta)
  return [all_distance, delta].min
end


def closest_points_split(points, delta)
  i = 0
  min_distance = delta

  size = points.size-7
  size = points.size if size < 1 

  while i < size
    for j in 1..7
      break unless j+i < points.size
      a = points[i] 
      b = points[j+i] 
      
      distance = a.distance(b)
      min_distance = distance if distance < min_distance

    j += 1
    end
    i += 1
  end

  min_distance
end
