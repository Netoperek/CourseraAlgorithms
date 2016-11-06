require 'set'
require 'pry'

INFINITY = 1000000

def min(queue, distance)
  min = INFINITY
  index = -1
  queue.each do |ele|
    if distance[ele] < min
      min = distance[ele] 
      index = ele
    end
  end
  index
end

def dijkstra(graph, source)
  distance = []
  queue = []

  for i in 1..graph.size-1 do
    distance[i] = INFINITY
    queue.push(i)
  end
  distance[source] = 0

  while queue.size > 0
    u = min(queue, distance)
    queue.delete(u)

    graph[u].each do |v|
      vertex = v[:vertex]
      length = v[:length]
      alt = distance[u] + length

      distance[vertex] = alt if alt < distance[vertex]
    end
  end

  distance
end
