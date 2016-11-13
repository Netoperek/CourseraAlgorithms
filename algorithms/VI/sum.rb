require 'set'
require 'pry'

def sum_2(numbers)
  numbers_hash = {}
  count = 0
  set = Set.new
  numbers = numbers.uniq
  numbers.each do |ele|
    key = ele / 10000.0
    key = key.to_i
    numbers_hash[key] = ele
  end

  count = 0

  numbers_hash.each do |k, v|
    if numbers_hash[k] && numbers_hash[-k]
      count += 1
    end
  end

  count
end
