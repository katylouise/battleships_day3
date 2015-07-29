require_relative 'grid'
#require_relative 'ship'
require_relative 'board'

class Player
  attr_accessor :board, :ships

  def initialize(name)
    @name = name
    @points = 0
    @board = Board.new
    @ships = []
  end

  def place(ship, location, direction=:north)
    ships << ship
    board.place(ship, location, direction)
  end

  def shoot(location)
    cell = board.grid.find_cell(board.coordinate_converter(location))
    cell.hit
  end

  def display_grid
    board.display_grid
  end
end