def merge(array_a, array_b)
  output = []
  a_idx = 0
  b_idx = 0

  while a_idx < array_a.size || b_idx < array_b.size
    return output + array_b[b_idx..array_b.size] if array_a[a_idx].nil?
    return output + array_a[a_idx..array_a.size] if array_b[b_idx].nil?
    
    if array_a[a_idx] < array_b[b_idx]
      output.push(array_a[a_idx])
      a_idx += 1 
    else
      output.push(array_b[b_idx])
      b_idx += 1 
    end
  end
  output
end


def mergesort(numbers)
  return numbers if numbers.size == 1                                        
                                                                               
  m = numbers.length / 2                                                       
  merge( mergesort(numbers[0..m-1]),  mergesort(numbers[m..numbers.size]) )
end
