class ComparisionNumber
  attr_accessor :pivot_version, :comparisons

  # 0 - first element
  # 1 - last element
  # 2 - mediana
  #
  def initialize(pivot_version)
    @pivot_version = pivot_version
    @comparisons = 0
  end

  def choose_pivot(numbers, left, right)
    return left if @pivot_version == 0
    return right if @pivot_version == 1
    
    if @pivot_version == 2
      first = numbers[left]                                                                     
      last = numbers[right]                                                                      
      mid = numbers[(right-left) / 2 + left]                                                         
      return left if first <= last && first >= mid || first >= last && first <= mid           
      return right if last <= first && last >= mid || last >= first && last <= mid             
      return ((right-left) / 2 + left)if mid <= last && mid >= first || mid >= last && mid <= first
    end
  end

  def swap(numbers, i, j)
    tmp = numbers[i]
    numbers[i] = numbers[j]
    numbers[j] = tmp
  end

  def partition(numbers, left, right)
    pivot_index = choose_pivot(numbers, left, right)
    pivot = numbers[pivot_index]
    swap(numbers, left, pivot_index)

    i = left+1
    for j in left+1..right
      if numbers[j] < pivot
        swap(numbers, j, i)
        i = i+1
      end
    end
    swap(numbers, left, i-1)
    return i-1
  end

  def quicksort(numbers, left, right)
    return numbers if left >= right
    pivot = partition(numbers, left, right)
    @comparisons += right-left
    quicksort(numbers, left, pivot-1)
    quicksort(numbers, pivot+1, right)
  end
end
