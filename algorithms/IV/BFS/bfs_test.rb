require_relative '../../vertex'
require_relative '../../graph'
require_relative 'bfs'
require "test/unit"
 
class TestBFS < Test::Unit::TestCase
  def test_bfs
    vertices = [
      Vertex.new(1, [2, 3]),
      Vertex.new(2, [1, 4]),
      Vertex.new(3, [1, 4, 5]),
      Vertex.new(4, [2, 3, 5, 6]),
      Vertex.new(5, [3, 4, 6]),
      Vertex.new(6, [4, 5])
    ]

    graph = Graph.new(vertices.dup)
    assert_equal(true, bfs(graph, 1, 1))
  end

  def test_bfs2
    vertices = [
      Vertex.new(1, [2, 3]),
      Vertex.new(2, [1, 4]),
      Vertex.new(3, [1, 4, 5]),
      Vertex.new(4, [2, 3, 5, 6]),
      Vertex.new(5, [3, 4, 6]),
      Vertex.new(6, [4, 5])
    ]

    graph = Graph.new(vertices.dup)
    assert_equal(true, bfs(graph, 1, 4))
  end

  def test_bfs3
    vertices = [
      Vertex.new(1, [2, 3]),
      Vertex.new(2, [1, 4]),
      Vertex.new(3, [1, 4, 5]),
      Vertex.new(4, [2, 3, 5, 6]),
      Vertex.new(5, [3, 4, 6]),
      Vertex.new(6, [4, 5])
    ]

    graph = Graph.new(vertices.dup)
    assert_equal(true, bfs(graph, 1, 6))
  end

  def test_bfs4
    vertices = [
      Vertex.new(1, [2, 3]),
      Vertex.new(2, [1, 4]),
      Vertex.new(3, [1, 4, 5]),
      Vertex.new(4, [2, 3, 5, 6]),
      Vertex.new(5, [3, 4, 6]),
      Vertex.new(6, [4, 5])
    ]

    graph = Graph.new(vertices.dup)
    assert_equal(false, bfs(graph, 1, 7))
  end
end
