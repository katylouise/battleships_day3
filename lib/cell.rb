require_relative 'water'

class Cell

  attr_accessor :content, :status, :display_symbol

  def initialize(options={})
    options = defaults.merge(options)
    @content = options[:content]
    @status = :not_hit
    @display_symbol = content.symbol
  end

  def change_contents(ship)
    fail "Occupied" if content === ship
     ship.status = :afloat
    @content = ship
  end

  def hit
    fail "You have already hit this spot" if hit?
    @status = :hit
    @display_symbol = 'x'
    content.hit
  end

  def hit?
    true if status == :hit
  end

  private

  def defaults
    {content: Water.new}
  end
end
