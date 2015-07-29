require_relative 'grid'

class Board

  def initialize
    @display = display_grid
  end

  def display_grid
    Grid.new.matrix_builder.map { |row| row.map { |e| e.content.symbol  } }
    #check if we get a need grid each time we display board
    #change Grid.new
  end

  def place (hash_location = {})
    number_coords = coordinate_converter(hash_location[:coordinate])

  end

  private

  def coordinate_converter(coordinate)
    alpha_table = {}
    (('A'..'Z').zip(0..25)).each { |x| alpha_table[x[0]] = x[1] }
    coord_arr = coordinate.to_s.split('')
    x = coord_arr[0]
    y = coord_arr[1]

    @x = alpha_table[x.upcase]
    @y = (y.to_i - 1)

    #conversion = [[@x],[@y]]
  end
end
