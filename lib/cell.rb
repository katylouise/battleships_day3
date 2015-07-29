require_relative 'water'

class Cell

  attr_accessor :content

  def initialize(options={})
    options = defaults.merge(options)
    @content = options[:content]
  end

  def change_contents(ship)
    @content = ship
  end

  private

  def defaults
    {content: Water.new}
  end
end
