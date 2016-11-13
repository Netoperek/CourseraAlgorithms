require 'set'

def sum_2_naive(numbers)
  count = 0
  sums_set = Set.new

  numbers_hash = {} 
  numbers.each do |ele|
    numbers_hash[ele] = ele
  end

  for t in -10000..10000
    for i in 0..numbers.size-1
      number = numbers[i]
      if numbers_hash[t-number]
        count += 1 
        break
      end
    end
    puts t
  end
  count
end
