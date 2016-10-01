require_relative 'mergesort'
require "test/unit"
 
class TestSimpleNumber < Test::Unit::TestCase
  def test_merge
    array_a = [1, 2, 6, 7]
    array_b = [3, 4, 5, 8]
    output = [1, 2, 3, 4, 5, 6, 7, 8]
    assert_equal(output, merge(array_a, array_b))

    array_c = [1, 2, 6, 7]
    array_d = [3, 4, 5, 8, 9]
    output = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    assert_equal(output, merge(array_c, array_d))

    array_e = [1, 2, 6, 7, 10, 11]
    array_f = [3, 4, 5, 8, 9]
    output = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    assert_equal(output, merge(array_e, array_f))
  end

  def test_mergesort
    array = [1, 3, 8, 7, 3, 5, 6, 2]
    assert_equal(mergesort(array), array.sort)

    array = [1, 3, 8, 7, 3, 5, 6, 2, 19]
    assert_equal(mergesort(array), array.sort)
  end
end
