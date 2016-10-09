require 'pry'

def cut_grid(grid, start_point, end_point)
  grid = grid[start_point[:x]..end_point[:x]]
  grid.map { |row| row[start_point[:y]..end_point[:y]]}
end

def local_minimum_in_grid(grid)
  row = (grid.size-1) / 2
  column = (grid.size-1) / 2

  min = Float::INFINITY

  for i in 0..grid.first.size-1
    if grid[column][i] < min
      min = grid[column][i] 
      x = row
      y = i
    end
  end

  for i in 0..grid.size-1
    if grid[i][row] < min
      min = grid[i][row] 
      x = i
      y = column
    end
  end

  right, left, bottom, top = nil, nil, nil, nil
  right = grid[x+1][y] if grid[x+1] && grid[x+1][y] 
  left = grid[x-1][y] if grid[x-1] && grid[x-1][y]
  top = grid[x][y+1] if grid[x] && grid[x][y+1]
  bottom = grid[x][y-1] if grid[x] && grid[x][y-1]

  x_new, y_new = -1, -1
  if left && left < min
    x_new = x-1
    min = left
  end

  if right && right < min
    x_new = x+1 
    min = right
  end

  if top && top < min
    y_new = y-1 
    min = top
  end

  if bottom && bottom < min
    y_new = y+1 
    min = bottom
  end
  
  return min if x_new == -1 && y_new == -1

  x = x_new unless x_new == -1
  y = y_new unless y_new == -1

  # Up-Left
  #
  if x < row && y < column
    start_point = { :x => 0, :y => 0}  
    end_point = { :x => row, :y => column}
  end

  # Up-Right
  #
  if x < row && y > column
    start_point = { :x => 0, :y => column}  
    end_point = { :x => row, :y => grid.size-1 } 
  end

  # Down-Left
  #
  if x > row && y < column
    start_point = { :x => row, :y => 0}  
    end_point = { :x => grid.size-1, :y => column } 
  end

  # Down-Right
  #
  if x > row && y > column
    start_point = { :x => row, :y => column}  
    end_point = { :x => grid.size-1, :y => grid.size-1 } 
  end
  
  local_minimum_in_grid(cut_grid(grid, start_point, end_point))
end
