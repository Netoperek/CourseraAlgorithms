require_relative 'heap_max'
require_relative 'heap_min'

def medians(numbers)
  heap_high = HeapMin.new
  heap_low = HeapMax.new
  medians = []

  number = numbers.shift
  heap_low.insert(number)
  medians.push(number)

  while numbers.size > 0
    number = numbers.shift

    if number < heap_low.heap.first
      heap_low.insert(number)
    else
      heap_high.insert(number)
    end

    if (heap_high.heap.size - heap_low.heap.size) == 2
      min = heap_high.extract_min
      heap_low.insert(min)
    end

    if (heap_low.heap.size - heap_high.heap.size) == 2
      max = heap_low.extract_max      
      heap_high.insert(max)
    end

    if heap_low.heap.size >= heap_high.heap.size
      medians.push(heap_low.heap.first)
    else
      medians.push(heap_high.heap.first)
    end
  end
  medians.reduce(:+) % 10000
end
