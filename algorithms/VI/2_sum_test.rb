require_relative 'sum'
require 'test/unit'
require 'pry'

class Sum2Test < Test::Unit::TestCase
  def test_2_sum
    #numbers = [1, 2, 7, 9, 5, 4, 6]
    #assert_equal(2, sum_2(numbers))

    numbers = []
    File.readlines('input').each do |line|
      numbers.push(line.to_i)
    end

    assert_equal(47262, sum_2(numbers))
  end
end
