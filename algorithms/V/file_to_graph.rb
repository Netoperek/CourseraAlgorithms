require 'pry'

def file_to_graph(file)
  graph = []
  File.readlines(file).each do |line|
    vertex = line.split
    id = vertex.shift.to_i
    vertex.each do |edge|
      vertex = edge.split(',')[0].to_i
      length = edge.split(',')[1].to_i
      graph[id] ||= []
      graph[id].push({:vertex => vertex, :length => length})
    end
  end

  graph
end
