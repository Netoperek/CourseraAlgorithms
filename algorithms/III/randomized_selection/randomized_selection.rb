def swap(numbers, i, j)
  tmp = numbers[i]
  numbers[i] = numbers[j]
  numbers[j] = tmp
end

def random_pivot(numbers)
  (0..numbers.size-1).to_a.sample
end

def partition(numbers)
  pivot_index = random_pivot(numbers)
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

def randomized_selection(numbers, order_statistic)
  return numbers.first if numbers.size == 1
  pivot_index = partition(numbers)
  return numbers[pivot_index] if pivot_index == order_statistic
  return randomized_selection(numbers[pivot_index+1..numbers.size-1], order_statistic-pivot_index-1) if pivot_index < order_statistic
  return randomized_selection(numbers[0..pivot_index-1], order_statistic) if pivot_index > order_statistic
end
