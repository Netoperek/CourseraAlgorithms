class HeapMin
  attr_accessor :heap

  def initialize
    @heap = []
  end

  def parent_index(key_index)
    if key_index.odd?
      parent_index = key_index / 2.0
      parent_index.to_i
    else
      parent_index = key_index - 1
    end
  end

  def smaller_child_index(key_index)
    left_child_index = key_index * 2 + 1
    right_child_index = key_index * 2 + 2
    left_child = @heap[left_child_index]
    right_child = @heap[right_child_index]

    return nil if left_child.nil? && right_child.nil?
    return right_child_index if left_child.nil?
    return left_child_index if right_child.nil?

    if left_child < right_child
      left_child_index
    else
      right_child_index
    end
  end

  def swap(i, j)
    tmp = @heap[i]
    @heap[i] = @heap[j]
    @heap[j] = tmp
  end

  def bubble_up(key_index)
    return if key_index == 0
    parent_index = parent_index(key_index)
    return if @heap[key_index] >= @heap[parent_index]
    swap(key_index, parent_index) 
    bubble_up(parent_index)
  end
  
  def insert(key)
    @heap.push(key)
    key_index = @heap.size-1
    bubble_up(key_index)
  end

  def bubble_down(key_index)
    return if smaller_child_index(key_index).nil?
    return if @heap[key_index] < @heap[smaller_child_index(key_index)]

    child_index = smaller_child_index(key_index)
    swap(child_index, key_index)
    bubble_down(child_index)
  end

  def extract_min
    min = @heap.first
    last = @heap.pop
    @heap[0] = last
    @heap = [] if last == min
    bubble_down(0)
    min
  end
end
