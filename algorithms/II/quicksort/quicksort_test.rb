require_relative 'quicksort'
require "test/unit"
require "set"
require "pry"
 
class QuicksortTest < Test::Unit::TestCase

  def random_array
    numbers_set = Set.new
    numbers = []
    1000.times do
      while true
        number = (1..1000).to_a.sample
        unless numbers_set.include? number
          numbers_set.add number
          numbers.push number
          break
        end
      end
    end
    numbers
  end

  def test_quicksort
    array = [1, 3, 8, 7, 3, 5, 6, 2]
    assert_equal(quicksort(array, 0, array.size-1), array.sort)

    array = [1, 3, 8, 7, 3, 5, 6, 2, 19]
    assert_equal(quicksort(array, 0, array.size-1), array.sort)

    array = random_array
    assert_equal(quicksort(array, 0, array.size-1), array.sort)
  end
end
