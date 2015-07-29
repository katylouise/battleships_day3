require_relative 'water'

class Cell

  attr_accessor :content, :status

  def initialize(options={})
    options = defaults.merge(options)
    @content = options[:content]
    @status = :not_hit
  end

  def change_contents(ship)
    fail "Occupied" if content === ship
    @content = ship
  end

  def hit
    @status = :hit
  end

  def hit?
    true if status == :hit
  end

  private

  def defaults
    {content: Water.new}
  end
end
