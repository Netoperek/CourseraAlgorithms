require 'set'
require 'pry'

def check_sums(array_a, array_b, t)
  count = 0
  for a in array_a
    for b in array_b
      sum = a + b
      if sum <= 10000 && sum >= -10000 && !t.include?(sum)
        count += 1
        t.add(sum)
      end
    end
  end
  count
end

def sum_2(numbers)
  numbers_hash = {}
  omitted = []
  count = 0
  numbers.each do |ele|
    key = ele / 10000000.0
    key = key.to_i
    numbers_hash[key] ||= []
    numbers_hash[key].push(ele)
  end

  t = Set.new

  numbers_hash.each do |k, v|
    if numbers_hash[k] && numbers_hash[-k]
      count += check_sums(numbers_hash[k], numbers_hash[-k], t)
    end
  end
  count
end
