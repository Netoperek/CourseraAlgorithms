def file_to_directed_graph(file, reverse_edges=false)
  graph_vertices = []
  File.readlines(file).each do |line|
    edge = line.split

    if reverse_edges 
      to = edge.shift.to_i
      from = edge.shift.to_i
    else
      from = edge.shift.to_i
      to = edge.shift.to_i
    end

    if graph_vertices[from]
      graph_vertices[from].push(to)
    else
      graph_vertices[from] = []
      graph_vertices[from].push(to)
    end
  end

  graph_vertices
end
