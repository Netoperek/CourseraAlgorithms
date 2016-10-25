require_relative '../../vertex'
require_relative 'file_to_graph'
require_relative '../../graph'
require_relative 'minimum_cut'
require 'test/unit'
require 'pry'
 
class MinimumCutTest < Test::Unit::TestCase
 # def test_minimum_cut
 #   vertices = [
 #     Vertex.new(0,[1, 2]),
 #     Vertex.new(1,[0, 2, 3]),
 #     Vertex.new(2,[0, 1, 3]),
 #     Vertex.new(3,[1, 2])
 #   ]

 #   graph = Graph.new(vertices)
 #   assert_equal(2, run_minimum_cut(graph))
 # end


  def test_minimum_cut_2
    outcomes = {}
    i = 0
    5000.times do
      i += 1
      puts "Times #{i}"
      graph = file_to_graph('input_graph')
      outcome = minimum_cut(graph)
      outcomes[outcome] += 1 if outcomes[outcome]
      outcomes[outcome] = 1 unless outcomes[outcome]
    end
    puts 'OUTCOMES'
    puts outcomes.sort_by { |k, v| v }
    outcome = outcomes.max_by { |k, v| v }.first
    assert_equal(17, outcome)
  end
end
