require_relative 'grid'
require_relative 'board'

class Player
  attr_accessor :board, :ships

  def initialize
    @points = 0
    @ships = []
  end

  def add_board board
    @board = board
  end

  def has_board?
    @board ? true : false
  end

  def place(ship, location, direction)
    fail 'too many ships' if full?
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

  private

  def full?
    ships.count >= board.ship_capacity
  end

end
