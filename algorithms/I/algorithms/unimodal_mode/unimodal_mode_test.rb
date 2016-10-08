require_relative 'unimodal_mode'
require 'test/unit'
 
class TestUnimodalMode < Test::Unit::TestCase
  def test_unimodal_mode
    numbers = [10, 20, 123, 512, 610, 50, 24, 12 ,11]
    assert_equal(numbers.max, unimodal_mode(numbers))

    numbers = [123, 511, 641, 1000, 631, 500, 400, 300 ,0]
    assert_equal(numbers.max, unimodal_mode(numbers))
  end
end
