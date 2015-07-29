require_relative 'water'

class Cell

  attr_accessor :content

  def initialize(options={})
    options = defaults.merge(options)
    @content = options[:content]
  end

  def change_contents(ship)
    fail "Occupied" if content.is_a?(Ship)
    @content = ship
  end

  private

  def defaults
    {content: Water.new}
  end
end
