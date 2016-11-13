def medians_naive(numbers)
  medians = []
  sorted_numbers = []

  while numbers.size > 0
    sorted_numbers.push(numbers.shift)
    sorted_numbers.sort!
    medians.push(sorted_numbers[(sorted_numbers.size-1)/2])
  end

  medians.reduce(:+) % 10000
end
