require_relative 'vertex'

# Graph as list of vertices
#
class Graph
  attr_accessor :vertices

  def initialize(vertices)
    @vertices = vertices
  end
end
