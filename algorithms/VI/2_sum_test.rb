require_relative 'sum'
require_relative 'sum_naive'
require 'test/unit'
require 'pry'

class Sum2Test < Test::Unit::TestCase
  def test_2_sum
    numbers = []
    File.readlines('input').each do |line|
      numbers.push(line.to_i)
    end

    #assert_equal(426, sum_2_naive(numbers))

    assert_equal(427, sum_2(numbers))
    #7263
    #90445945034
  end
end
