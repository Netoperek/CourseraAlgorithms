require_relative 'local_minimum_in_grid'
require "test/unit"
require "set"
require "pry"
 
class TestLocalMinimumInGrid < Test::Unit::TestCase

  def random_grid(n)
    numbers_set = Set.new
    grid = Array.new(n) { Array.new(n) }

    for i in 0..n-1 do
      for j in 0..n-1 do
        while true
          number = (1..10000).to_a.sample
          unless numbers_set.include?(number)
            numbers_set.add(number)
            grid[i][j] = number
            break
          end
        end
      end
    end
    grid
  end

  def get_x_y(grid, value)
    for i in 0..grid.size-1
      for j in 0..grid.size-1
        return { :x => i, :y => j } if grid[i][j] == value      
      end
    end
  end

  def test_local_minimum_in_grid
    grid = [
      [20,  100, 12,  11,  10,  101, 2],
      [19,  102, 13,  103, 9,   104, 3],
      [18,  105, 14,  106, 8,   108, 4],
      [17,  16,  15,  106, 7,   6,   5],
      [109, 110, 111, 112, 113, 114, 115],
      [116, 117, 118, 119, 120, 121, 122],
      [123, 124, 125, 126, 127, 128, 129]
    ]
    local_minimum = local_minimum_in_grid(grid)   
    point = get_x_y(grid, local_minimum)
    x = point[:x]
    y = point[:y]

    right, left, bottom, top = true, true, true, true
    right = grid[x][y] < grid[x+1][y] if grid[x+1] && grid[x+1][y]
    left = grid[x][y] < grid[x-1][y] if grid[x-1] && grid[x-1][y]
    top = grid[x][y] < grid[x][y+1] if grid[x] && grid[x][y+1]
    bottom = grid[x][y] < grid[x][y-1] if grid[x] && grid[x][y-1]

    assert_equal(true, right && left && top && bottom)
  end
end
