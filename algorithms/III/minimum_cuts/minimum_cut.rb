require_relative '../../vertex'
require_relative '../../graph'
require 'pry'

def minimum_cut(graph)
  binding.pry
  while graph.vertices.size > 2
    u = graph.vertices[(0..graph.vertices.size-1).to_a.sample]
    v_id = u.neighbours[(0..u.neighbours.size-1).to_a.sample]

    # merge 2 vertices
    #
    v = graph.vertices.find { |vertex| vertex.id == v_id}
    u.neighbours.delete_if { |vertex| vertex.id == v_id }
    u.neighbours += v.neighbours
    graph.vertices.delete_if { |vertex| vertex.id = v_id }

    # remove self-loops
    #
    u.neighbours.delete_if { |vertex| vertex.id = u.id }
  end
  binding.pry
end
