require_relative 'grid'

class Board
  attr_accessor :grid

  def initialize
    @grid = Grid.new
  end

  def display_grid
    grid.matrix.map { |row| row.map { |e| e.content.symbol  } }
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

  def coordinate_converter(coordinate)
    alpha_table = {}
    (('A'..'Z').zip(0..25)).each { |x| alpha_table[x[0]] = x[1] }
    x = coordinate.to_s.slice!(0)
    y = coordinate

    @x = alpha_table[x.upcase]
    @y = (y.to_i - 1)

    [@x,@y]
  end
end
