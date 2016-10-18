class Vertex
  attr_accessor :id, :neighbours

  def initialize(id, neighbours)
    @id = id
    @neighbours = neighbours
  end
end
