require 'terminal-table'
require_relative 'grid'

class Board
  attr_accessor :grid
  attr_reader :size, :ship_capacity

  DEFAULT_SIZE = 10
  DEFAULT_CAPACITY = 5

  def initialize(options={})
    options = defaults.merge(options)
    @size = options[:size]
    @ship_capacity = options[:ship_capacity]
    @grid = Grid.new @size
  end

  def display_grid
    rows = grid.matrix.map { |row| row.map { |cell| cell.display_symbol } }

    #rows.each_with_index.map { |row, i| row.unshift(i + 1) }
    table = Terminal::Table.new :rows => rows, :headings => ('A'..'J')
    # print number_table
    print table
  end

  # def number_table
  #   rows = []
  #   (1..size).each { |n| rows << [n] }
  #   rows.unshift([" "])
  #   number_table = Terminal::Table.new :rows => rows
  # end

  def check_coord (ship, number_coordinate, direction)
    direction == :horizontal ? grid_reference = 0 : grid_reference = 1
    fail "Your ship is off the grid" if number_coordinate[grid_reference] + ship.size > grid.size
    grid_reference
  end

  def place (ship, coordinate, direction)
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
    x = coordinate[0].upcase
    y = coordinate[1..-1]
    [alpha_table[x], (y.to_i - 1)]
  end

  def defaults
    {
      size: DEFAULT_SIZE,
      ship_capacity: DEFAULT_CAPACITY
    }
  end
end
