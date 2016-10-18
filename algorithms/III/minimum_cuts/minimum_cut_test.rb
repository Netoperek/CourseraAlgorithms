require_relative '../../vertex'
require_relative '../../graph'
require_relative 'minimum_cut'
require "test/unit"
 
class MinimumCutTest < Test::Unit::TestCase
  def test_minimum_cut
    vertices = [
      Vertex.new(0,[1, 2]),
      Vertex.new(1,[0, 2, 3]),
      Vertex.new(2,[0, 1, 3]),
      Vertex.new(3,[1, 2])
    ]

    graph = Graph.new(vertices)
    assert_equal(2, minimum_cut(graph))
  end
end
