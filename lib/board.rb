require_relative 'grid'

class Board
  attr_accessor :grid

  def initialize
    @grid = Grid.new
  end

  def display_grid
    grid.matrix.map { |row| row.map { |el| el.content.symbol  } }
  end

  def check_coord (ship, number_coordinate, direction)
    direction == :horizontal ? grid_reference = 0 : grid_reference = 1
    fail "Your ship is off the grid" if number_coordinate[grid_reference] + ship.size > grid.size
    grid_reference
  end

  def place (ship, coordinate, direction=:horizontal)
    number_coords = coordinate_converter(coordinate)
    grid_reference = check_coord(ship, number_coords, direction)
    add_ship_to_cells(ship, number_coords, grid_reference)
  end

  def add_ship_to_cells (ship, number_coordinate, grid_reference)
    ship.size.times do
      grid.find_cell(number_coordinate).change_contents(ship)
      number_coordinate[grid_reference] += 1
    end
  end

#Ask do we need to test place or add_ship_to_cells if we have tested their components?

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
