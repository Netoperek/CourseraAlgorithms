require_relative 'dijkstra'
require "test/unit"
 
class TestBFS < Test::Unit::TestCase
  def test_dijkstra
   # graph = [ 
   #   nil, 
   #   [
   #     {:vertex => 2, :length => 1},
   #     {:vertex => 3, :length => 4}
   #   ],
   #   [
   #     {:vertex => 3, :length => 2},
   #     {:vertex => 4, :length => 6}
   #   ],
   #   [
   #     {:vertex => 4, :length => 3}
   #   ],
   #   []
   # ]
   # assert_equal([nil, 0, 1, 3, 6], dijkstra(graph, 1))

   # graph = [ 
   #   nil, 
   #   [
   #     {:vertex => 2, :length => 1},
   #     {:vertex => 3, :length => -2}
   #   ],
   #   [
   #     {:vertex => 3, :length => -5},
   #   ],
   #   []
   # ]
   # assert_equal([nil, 0, 1, -4], dijkstra(graph, 1))

    graph = [ 
      nil, 
      [
        {:vertex => 2, :length => 1},
        {:vertex => 3, :length => 0},
        {:vertex => 4, :length => 99}
      ],
      [
        {:vertex => 3, :length => 1},
      ],
      [],
      [
        {:vertex => 2, :length => -300},
      ]
    ]
    assert_equal([nil, 0, 1, -4], dijkstra(graph, 1))
  end
end
