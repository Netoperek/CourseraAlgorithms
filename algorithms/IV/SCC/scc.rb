def scc(graph, graph_rev)
  $explored = []
  $finishing_times = {}
  $t = 0
  $leader = nil
  $leaders = {}
  $second = false
  first_dfs_loop(graph_rev)

  $leader = nil
  $leaders = {}
  $explored = []
  $second = true
  second_dfs_loop(graph)

  sccs_sizes = $leaders.map { |k,v| v.size }
  sccs_sizes.sort.reverse[0..4]
end

def dfs(graph, i)
  stack = [i]
  path = []
  
  while stack.size > 0
    i = stack.pop
    unless $explored[i]
      path.push(i)
      $explored[i] = true 

      $leaders[$leader] ||= []
      $leaders[$leader].push(i)

      graph[i].each { |j| stack.push(j) if !$explored[j]} if !graph[i].nil?
    end
  end

  while path.size > 0
    i = path.pop
    $t += 1
    $finishing_times[i] = $t
  end
end

def first_dfs_loop(graph)
  (1..graph.size-1).reverse_each do |i|
    dfs(graph, i) unless $explored[i]
  end
end

def second_dfs_loop(graph)
  $finishing_times.keys.reverse_each do |i|
    unless $explored[i]
      $leader = i
      dfs(graph, i) 
    end
  end
end
