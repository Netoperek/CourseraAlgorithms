require_relative '../../vertex'
require_relative '../../graph'

def file_to_graph(file)
  integers = File.read(file)
  vertices = integers.split("\n")
  vertices.map! { |vertex| vertex.split}
  vertices.map! { |vertex| Vertex.new(vertex.first, vertex[1..vertex.size-1]) }
  Graph.new(vertices)
end
