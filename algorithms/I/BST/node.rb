class Node
  attr_accessor :value, :left, :right, :parent

  def initialize(value)
    raise 'left should be instance of Node' unless (left.is_a?(Node) || left.nil?)
    raise 'right should be instance of Node' unless (right.is_a?(Node) || right.nil?)
    raise 'parent should be instance of Node' unless (parent.is_a?(Node) || parent.nil?)

    @value = value
    @left = nil
    @right = nil
    @parent = nil
  end
end
