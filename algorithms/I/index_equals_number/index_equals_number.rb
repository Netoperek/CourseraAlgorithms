require 'pry'

def index_equals_number(numbers)
  left = 0
  right = numbers.size-1

  while left <= right
    mid = (left + right)/2
    return true if mid == numbers[mid]
    
    if numbers[mid] > mid
      right = mid - 1
    else
      left = mid + 1
    end
  end
  return false
end
