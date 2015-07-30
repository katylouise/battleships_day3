require_relative 'grid'
#require_relative 'ship'
require_relative 'board'

class Player
  attr_accessor :board, :ships

  DEFAULT_BOARD_SIZE = 10

  def initialize(board_size=DEFAULT_BOARD_SIZE)
    # @name = name
    @points = 0
    @board = Board.new board_size
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
