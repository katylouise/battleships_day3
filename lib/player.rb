require_relative 'grid'
require_relative 'board'

class Player
  attr_accessor :board, :ships, :shots

  def initialize
    @points = 0
    @ships = []
    @shots = {}
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

  def shoot(board, location)
    cell = board.grid.find_cell(board.coordinate_converter(location))
    shots[location] = cell.hit
  end

  def game_status
    "You have #{ships.count - number_ships_sunk} ships left to sink!"
  end

  def display_grid
    board.display_grid
  end

  def number_ships_sunk
    ships.select { |ship| ship.status == :sunk }.count
  end

  def lost?
    ships.count > 0 && ships.all?{ |ship| ship.status == :sunk } ? true : false
  end

  private

  def full?
    ships.count >= board.ship_capacity
  end

end
