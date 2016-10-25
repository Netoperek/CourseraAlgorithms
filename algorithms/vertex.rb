class Vertex
  attr_accessor :id, :neighbours, :visited

  def initialize(id, neighbours)
    @id = id
    @neighbours = neighbours
    @visited = false
  end
end
