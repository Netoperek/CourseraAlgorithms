require_relative 'heap_min'
require_relative 'heap_max'
require 'test/unit'
require 'pry'
 
class HeapTest < Test::Unit::TestCase
  def test_heap_min
    heap_min = HeapMin.new

    heap_min.insert(25)
    assert_equal([25], heap_min.heap)
    assert_equal(true, heap_min.check_heap)

    heap_min.insert(7)
    assert_equal([7, 25], heap_min.heap)
    assert_equal(true, heap_min.check_heap)

    heap_min.insert(36)
    assert_equal([7, 25, 36], heap_min.heap)
    assert_equal(true, heap_min.check_heap)

    heap_min.insert(2)
    assert_equal([2, 7, 36, 25], heap_min.heap)
    assert_equal(true, heap_min.check_heap)

    heap_min.insert(17)
    assert_equal([2, 7, 36, 25, 17], heap_min.heap)
    assert_equal(true, heap_min.check_heap)

    heap_min.insert(3)
    assert_equal([2, 7, 3, 25, 17, 36], heap_min.heap)
    assert_equal(true, heap_min.check_heap)

    heap_min.insert(100)
    assert_equal([2, 7, 3, 25, 17, 36, 100], heap_min.heap)
    assert_equal(true, heap_min.check_heap)

    heap_min.insert(1)
    assert_equal([1, 2, 3, 7, 17, 36, 100, 25], heap_min.heap)
    assert_equal(true, heap_min.check_heap)

    assert_equal(heap_min.extract_min, 1)
    assert_equal([2, 7, 3, 25, 17, 36, 100], heap_min.heap)
    assert_equal(true, heap_min.check_heap)

    assert_equal(heap_min.extract_min, 2)
    assert_equal([3, 7, 36, 25, 17, 100], heap_min.heap)
    assert_equal(true, heap_min.check_heap)

    assert_equal(heap_min.extract_min, 3)
    assert_equal([7, 17, 36, 25, 100], heap_min.heap)
    assert_equal(true, heap_min.check_heap)

    assert_equal(heap_min.extract_min, 7)
    assert_equal([17, 25, 36, 100], heap_min.heap)
    assert_equal(true, heap_min.check_heap)

    assert_equal(heap_min.extract_min, 17)
    assert_equal([25, 100, 36], heap_min.heap)
    assert_equal(true, heap_min.check_heap)

    assert_equal(heap_min.extract_min, 25)
    assert_equal([36, 100], heap_min.heap)
    assert_equal(true, heap_min.check_heap)

    assert_equal(heap_min.extract_min, 36)
    assert_equal([100], heap_min.heap)
    assert_equal(true, heap_min.check_heap)

    assert_equal(heap_min.extract_min, 100)
    assert_equal([], heap_min.heap)
  end

  def test_heap_max
    heap_max = HeapMax.new

    heap_max.insert(25)
    assert_equal([25], heap_max.heap)
    assert_equal(true, heap_max.check_heap)

    heap_max.insert(7)
    assert_equal([25, 7], heap_max.heap)
    assert_equal(true, heap_max.check_heap)

    heap_max.insert(36)
    assert_equal([36, 7, 25], heap_max.heap)
    assert_equal(true, heap_max.check_heap)

    heap_max.insert(2)
    assert_equal([36, 7, 25, 2], heap_max.heap)
    assert_equal(true, heap_max.check_heap)

    heap_max.insert(17)
    assert_equal([36, 17, 25, 2, 7], heap_max.heap)
    assert_equal(true, heap_max.check_heap)

    heap_max.insert(3)
    assert_equal([36, 17, 25, 2, 7, 3], heap_max.heap)
    assert_equal(true, heap_max.check_heap)
    
    heap_max.insert(100)
    assert_equal([100, 17, 36, 2, 7, 3, 25], heap_max.heap)
    assert_equal(true, heap_max.check_heap)

    heap_max.insert(1)
    assert_equal([100, 17, 36, 2, 7, 3, 25, 1], heap_max.heap)
    assert_equal(true, heap_max.check_heap)

    assert_equal(heap_max.extract_max, 100)
    assert_equal([36, 17, 25, 2, 7, 3, 1], heap_max.heap)
    assert_equal(true, heap_max.check_heap)

    assert_equal(heap_max.extract_max, 36)
    assert_equal([25, 17, 3, 2, 7, 1], heap_max.heap)
    assert_equal(true, heap_max.check_heap)

    assert_equal(heap_max.extract_max, 25)
    assert_equal([17, 7, 3, 2, 1], heap_max.heap)
    assert_equal(true, heap_max.check_heap)

    assert_equal(heap_max.extract_max, 17)
    assert_equal([7, 2, 3, 1], heap_max.heap)
    assert_equal(true, heap_max.check_heap)
    
    assert_equal(heap_max.extract_max, 7)
    assert_equal([3, 2, 1], heap_max.heap)
    assert_equal(true, heap_max.check_heap)

    assert_equal(heap_max.extract_max, 3)
    assert_equal([2, 1], heap_max.heap)
    assert_equal(true, heap_max.check_heap)

    assert_equal(heap_max.extract_max, 2)
    assert_equal([1], heap_max.heap)
    assert_equal(true, heap_max.check_heap)

    assert_equal(heap_max.extract_max, 1)
    assert_equal([], heap_max.heap)
  end
end
