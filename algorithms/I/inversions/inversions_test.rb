require_relative 'inversions'
require_relative '../../file_to_array'
require "test/unit"

class TestInversions < Test::Unit::TestCase
  def test_inversions
    inversions = Inversions.new
    input = [1, 4, 2, 3]
    inversions.inversions(input)
    assert_equal(2, inversions.inversions_number)

    inversions = Inversions.new
    input = [1, 3, 5, 2, 4, 6]
    inversions.inversions(input)
    assert_equal(3, inversions.inversions_number)

    inversions = Inversions.new
    input = [6, 5, 4, 3, 2, 1]
    inversions.inversions(input)
    assert_equal(15, inversions.inversions_number)

    inversions = Inversions.new
    input = [1, 2, 3, 4, 5, 6]
    inversions.inversions(input)
    assert_equal(0, inversions.inversions_number)

    inversions = Inversions.new
    input = file_to_array('integers')
    inversions.inversions(input)
    assert_equal(2407905288, inversions.inversions_number)
  end
end
