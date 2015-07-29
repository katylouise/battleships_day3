class Grid

DEFAULT_SIZE = 10

attr_reader :matrix

  def initialize(options = {})
    options = defaults.merge(options)
    @size = options[:size]
    @matrix = matrix_builder
  end

  def matrix_builder
    Array.new(@size){Array.new(@size)}
  end

private

  def defaults
    {size: DEFAULT_SIZE }
  end
end
