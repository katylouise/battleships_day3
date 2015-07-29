require_relative 'water'

class Cell

  attr_reader :content

  def initialize(options={})
    options = defaults.merge(options)
    @content = options[:content]
  end

  private

  def defaults
    {content: Water.new}
  end
end
