require_relative 'file_to_directed_graph'
require_relative 'scc'
require 'test/unit'
require 'pry'
 
class SCCTest < Test::Unit::TestCase
  def test_scc
    #graph = file_to_directed_graph('my_scc')
    #graph_rev = file_to_directed_graph('my_scc', true)
    #assert_equal([3, 3, 3], scc(graph, graph_rev))

    #graph = file_to_directed_graph('my_scc2')
    #graph_rev = file_to_directed_graph('my_scc2', true)
    #assert_equal([4, 3, 3, 1], scc(graph, graph_rev))

    #graph = file_to_directed_graph('my_scc3')
    #graph_rev = file_to_directed_graph('my_scc3', true)
    #assert_equal([6, 4, 3], scc(graph, graph_rev))

    graph = file_to_directed_graph('SCC')
    graph_rev = file_to_directed_graph('SCC', true)
    puts 'Finished processing graphs'
    assert_equal([704, 372, 261, 244, 219], scc(graph, graph_rev))
  end
end
