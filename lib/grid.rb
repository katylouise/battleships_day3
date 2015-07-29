class Grid

DEFAULT_SIZE = 10

attr_reader :matrix

  def initialize(options = {})
    options = defaults.merge(options)
    @size = options[:size]
    matrix_builder
  end

  def matrix_builder
    @matrix = Array.new(@size) { Array.new(@size) }
    @matrix.map! { |row| row.map { |cell| Cell.new}  }
  end

private

  def defaults
    {size: DEFAULT_SIZE }
  end
end
