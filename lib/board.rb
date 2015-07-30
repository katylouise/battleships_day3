require_relative 'grid'

class Board
  attr_accessor :grid

  def initialize
    @grid = Grid.new
  end

  def display_grid
    grid.matrix.map { |row| row.map { |el| el.content.symbol  } }
  end

  def place (ship, coordinate, direction=:north)
    number_coords = coordinate_converter(coordinate)
    ship.size.times do
      cell = grid.find_cell(number_coords)
      cell.change_contents(ship)
      case direction
      when :north
        fail "Your ship is off the grid" if number_coords[1] + ship.size > grid.size
        number_coords[1] += 1
      when :south
        fail "Your ship is off the grid" if number_coords[1] - ship.size < grid.size
        number_coords[1] -= 1
      when :east
        fail "Your ship is off the grid" if number_coords[0] - ship.size < grid.size
        number_coords[0] -= 1
      when :west
        fail "Your ship is off the grid" if number_coords[0] + ship.size > grid.size
        number_coords[0] += 1
      end
    end
  end

  def alphabet_hash
    alpha_table = {}
    (('A'..'Z').zip(0..25)).each { |x| alpha_table[x[0]] = x[1] }
    alpha_table
  end

  def coordinate_converter(coordinate)
    alpha_table = alphabet_hash
    x = coordinate.slice!(0).upcase
    y = coordinate.to_i
    [alpha_table[x], (y - 1)]
  end
end
