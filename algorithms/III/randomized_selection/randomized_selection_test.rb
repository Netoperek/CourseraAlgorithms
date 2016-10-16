require_relative 'randomized_selection'
require "test/unit"
require "set"
require "pry"
 
class RandomizedSelectionTest < Test::Unit::TestCase

  def random_uniq_array
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

  def test_randomized_selection
    array = [0, 15, 11, 6, 9, 3, 7, 13, 2, 19]
    assert_equal(array.sort[5], randomized_selection(array, 5))

    array = random_uniq_array
    assert_equal(array.sort[512], randomized_selection(array, 512))
  end
end
