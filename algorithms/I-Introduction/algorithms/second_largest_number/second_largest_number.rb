require_relative '../BST/bst'
require_relative '../BST/node'
require 'pry'

def second_largest_point(numbers)
  root = Node.new(numbers.first)
  bst = BST.new(root)
  max = numbers.first
  numbers[1..-1].each do |ele|
    max = ele if ele > max
    bst.insert(Node.new(ele))
  end

  max_node = bst.search(max)
  if max_node.left
    max_node.left.value
  else
    return max_node.parent.value
  end

  second_largest = max_node.left
  while second_largest.right
    second_largest = second_largest.right
  end
  second_largest.value
end
