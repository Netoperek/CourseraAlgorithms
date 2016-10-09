def unimodal_mode(numbers)
  return numbers.first if numbers.size == 1
  mid = (numbers.size-1) / 2

  if numbers[mid] > numbers[mid+1]
    unimodal_mode(numbers[0..mid])
  else
    unimodal_mode(numbers[mid+1..-1])
  end
end
