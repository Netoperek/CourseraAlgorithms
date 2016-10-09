require_relative 'second_largest_number'
require 'set'
require 'test/unit'
 
class TestSecondLargestNumber < Test::Unit::TestCase
  def test_second_largest_number
    numbers_set = Set.new
    numbers = []

    100.times do
      while true
        number = (1..100000).to_a.sample
        unless numbers_set.include? number
          numbers_set.add(number)
          numbers.push(number)
          break
        end
      end
    end

    second_largest = numbers.sort[-2]
    assert_equal(second_largest, second_largest_point(numbers))
  end
end
