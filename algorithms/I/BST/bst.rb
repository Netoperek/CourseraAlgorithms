require_relative 'node' 

class BST
  attr_accessor :root

  def initialize(root)
    raise 'root should be an instance of Node' unless root.is_a? Node
    @root = root
  end

  def insert(node)
    raise 'node should be an instance of Node' unless root.is_a? Node
    current_node = @root
   
    while true
      if node.value > current_node.value
        if current_node.right.nil?
          current_node.right = node
          node.parent = current_node
          return
        else
          current_node = current_node.right
        end
      else
        if current_node.left.nil?
          current_node.left = node
          node.parent = current_node
          return
        else
          current_node = current_node.left
        end
      end
    end
  end

  def search(value)
    current_node = @root
    while current_node.value != value
      if current_node.value < value
        return nil if current_node.right.nil?
        current_node = current_node.right
      else
        return nil if current_node.left.nil?
        current_node = current_node.left
      end
    end
    current_node
  end
end
