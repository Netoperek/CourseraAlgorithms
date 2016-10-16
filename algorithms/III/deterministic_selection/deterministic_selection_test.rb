require_relative 'deterministic_selection'
require "test/unit"
require "set"
require "pry"
 
class DeterministicSelectionTest < Test::Unit::TestCase

  def random_uniq_array
    numbers_set = Set.new
    numbers = []
    numbers_to_random = (1..2000000).to_a
    1000000.times do
      while true
        number = numbers_to_random.sample
        unless numbers_set.include? number
          numbers_set.add number
          numbers.push number
          break
        end
      end
    end
    numbers
  end

  def test_medians_of_median
    array = [0, 21, 32, 56, 15, 11, 6, 9, 3, 7, 13, 2, 19, 1, 22, 54, 98, 41, 66, 77]
    assert_equal(19, array[median_of_medians(array)])
  end
  
  def test_deterministic_selection
    array = [0, 15, 11, 6, 9, 3, 7, 13, 2, 19]
    assert_equal(array.sort[5], deterministic_selection(array, 5))

    array = random_uniq_array
    puts 'FINISHED'
    assert_equal(array.sort[512], deterministic_selection(array, 512))
  end
end
