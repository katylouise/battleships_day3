require_relative 'grid'

class Player
  def initialize(name)
    @name = name
  end

  def shoot(location)
    cell = grid.find_cell(board.coordinate_converter)
    cell.hit
  end
end