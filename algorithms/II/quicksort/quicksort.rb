def partition(numbers, left, right)
  pivot = numbers[left]
  i = left+1
  for j in left+1..right
    if numbers[j] < pivot
      tmp = numbers[j]
      numbers[j] = numbers[i] 
      numbers[i] = tmp
      i = i+1
    end
  end
  tmp = numbers[left]
  numbers[left] = numbers[i-1]
  numbers[i-1] = tmp
  return i-1
end

def quicksort(numbers, left, right)
  return numbers if left >= right
  pivot = partition(numbers, left, right)
  quicksort(numbers, left, pivot-1)
  quicksort(numbers, pivot+1, right)
end
