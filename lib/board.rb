require_relative 'grid'

class Board
  attr_accessor :grid

  def initialize
    @grid = Grid.new
  end

  def display_grid
    grid.matrix.map { |row| row.map { |el| el.content.symbol  } }
  end

  def place (ship, coordinate, direction=:horizontal)
    number_coords = get_number_coordinates(coordinate)
    ship.size.times do
      cell = grid.find_cell(number_coords)
      cell.change_contents(ship)
      lambda do |direction|
        direction == :horizontal ? coordinate = 0 : coordinate = 1
        fail "Your ship is off the grid" if number_coords[coordinate] + ship.size > grid.size
        number_coords[coordinate] += 1
      end.call(direction)
    end
  end

  def get_number_coordinates(coordinate)
    coordinate_converter(coordinate)
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
