require_relative 'index_equals_number'
require "test/unit"
 
class TestIndexEqualsNumber < Test::Unit::TestCase

  def test_index_equals_number
    numbers = [-21, -10, 2, 3, 12, 51, 61, 124, 162, 412421]
    assert_equal(true, index_equals_number(numbers))

    numbers = [-21, -10, -9, 3, 12, 51, 61, 124, 162, 412421]
    assert_equal(true, index_equals_number(numbers))

    numbers = [-123, -21, -10, -9, 4, 12, 51, 61, 124, 162, 412421]
    assert_equal(true, index_equals_number(numbers))

    numbers = [-123, -21, -10, -9, 5, 12, 51, 61, 124, 162, 412421]
    assert_equal(false, index_equals_number(numbers))

    numbers = [-1, -2, -3, -4, -5, -6, -7, 7]
    assert_equal(true, index_equals_number(numbers))
  end
end
