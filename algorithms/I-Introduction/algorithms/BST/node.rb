class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    raise 'left should be instance of Node' unless (left.is_a?(Node) || left.nil?)
    raise 'right should be instance of Node' unless (right.is_a?(Node) || right.nil?)

    @value = value
    @left = nil
    @right = nil
  end
end
