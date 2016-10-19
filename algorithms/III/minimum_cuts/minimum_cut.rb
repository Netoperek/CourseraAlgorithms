require_relative '../../vertex'
require_relative '../../graph'

def minimum_cut(graph)
  while graph.vertices.size > 2
    # 2 random, adjecent vertices
    #
    u = graph.vertices[(0..graph.vertices.size-1).to_a.sample]
    v_id = u.neighbours[(0..u.neighbours.size-1).to_a.sample]
    v = graph.vertices.find { |vertex| vertex.id == v_id}

    # merge 2 vertices
    #
    u.neighbours += v.neighbours
    graph.vertices.delete_if { |vertex| vertex.id == v_id }
    graph.vertices = graph.vertices.each do |vertex|
      vertex.neighbours.map! { |ele| ele == v_id ? u.id : ele }
    end

    # remove self-loops
    #
    u.neighbours.delete u.id
  end

  graph.vertices.first.neighbours.size
end
