def swap(numbers, i, j)
  tmp = numbers[i]
  numbers[i] = numbers[j]
  numbers[j] = tmp
end

def median_of_medians(numbers)
  numbers_copy = numbers.dup
  parts = numbers_copy.size / 5
  medians = []
  for i in 1..5
    part = numbers_copy[(i-1)*parts..i*parts-1].sort
    medians.push(part[(part.size/2)-1])
  end
  numbers.find_index(medians.sort[2])
end

def partition(numbers)
  pivot_index = median_of_medians(numbers)
  pivot = numbers[pivot_index]
  swap(numbers, 0, pivot_index)

  i = 1
  for j in 1..numbers.size-1
    if numbers[j] < pivot
      swap(numbers, j, i)
      i = i+1
    end
  end
  swap(numbers, 0, i-1)
  return i-1
end

def deterministic_selection(numbers, order_statistic)
  return numbers.first if numbers.size == 1
  pivot_index = partition(numbers)
  return numbers[pivot_index] if pivot_index == order_statistic
  return deterministic_selection(numbers[pivot_index+1..numbers.size-1], order_statistic-pivot_index-1) if pivot_index < order_statistic
  return deterministic_selection(numbers[0..pivot_index-1], order_statistic) if pivot_index > order_statistic
end
