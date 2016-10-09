class Inversions
  attr_reader :inversions_number

  def initialize
    @inversions_number = 0
  end

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
        @inversions_number += array_a.size-a_idx
        output.push(array_b[b_idx])
        b_idx += 1
      end
    end
    output
  end

  def inversions(numbers)
    return numbers if numbers.size == 1

    m = numbers.length / 2
    merge(inversions(numbers[0..m-1]), inversions(numbers[m..numbers.size]))
  end
end
