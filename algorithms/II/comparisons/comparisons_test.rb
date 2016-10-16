require_relative 'comparisons'
require_relative '../../file_to_array'
require "test/unit"
require "pry"
 
class ComparisonsTest < Test::Unit::TestCase
  def test_comparisons
    # pivot as first element
    #
    cn = ComparisionNumber.new(0) 
    input = file_to_array('integers')
    input_sorted = file_to_array('integers').sort
    cn.quicksort(input, 0, input.size-1)
    assert_equal(input.sort, input_sorted)
    assert_equal(162085, cn.comparisons)

    # pivot as last element
    #
    cn = ComparisionNumber.new(1) 
    input = file_to_array('integers')
    input_sorted = file_to_array('integers').sort
    cn.quicksort(input, 0, input.size-1)
    assert_equal(input.sort, input_sorted)
    assert_equal(164123, cn.comparisons)

    # pivot as medium
    #
    cn = ComparisionNumber.new(2) 
    input = file_to_array('integers')
    input_sorted = file_to_array('integers').sort
    cn.quicksort(input, 0, input.size-1)
    assert_equal(input.sort, input_sorted)
    assert_equal(138382, cn.comparisons)
  end
end
