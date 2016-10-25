require_relative '../../vertex'
require_relative '../../graph'
require 'pry'

def bfs(graph, start_id, goal_id)
  queue = []
  queue.push(start_id)
  
  while queue.size > 0
    v_id = queue.shift
    v = graph.vertices.find { |ele| ele.id == v_id }
    v.neighbours.each do |w_id|
      return true if w_id == goal_id
      w = graph.vertices.find { |ele| ele.id == w_id }
      unless w.visited
        w.visited = true
        queue.push(w_id)
      end
    end
  end

  false
end
