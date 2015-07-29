require_relative 'grid'

class Board

  def initialize
    display_grid
  end

  def display_grid
    Grid.new.matrix_builder.map { |row| row.map { |e| e.content.symbol  } }
  end
end
