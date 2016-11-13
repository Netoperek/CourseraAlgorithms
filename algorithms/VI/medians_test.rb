require_relative 'medians'
require_relative 'medians_naive'
require_relative '../file_to_array'
require 'test/unit'
require 'pry'

class MediansTest < Test::Unit::TestCase
  def test_medians
    numbers = [100, 2, 25, 3, 7, 17, 19, 36, 1]
    assert_equal(195, medians(numbers))

    numbers = file_to_array('medians')
    assert_equal(1213, medians_naive(numbers))

    numbers = file_to_array('medians')
    assert_equal(1213, medians(numbers))
  end
end
