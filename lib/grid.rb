require_relative 'cell'

class Grid

attr_reader :matrix, :size

  def initialize(size)
    @size = size
    matrix_builder
  end

  def matrix_builder
    @matrix = Array.new(@size) { Array.new(@size) }
    @matrix.map! { |row| row.map { |cell| Cell.new}  }
  end

  def find_cell(number_coords)
    @matrix[number_coords[1]][number_coords[0]]
  end


end
