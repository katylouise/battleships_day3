class Water

  attr_reader :symbol

  def initialize
    @symbol = :~
  end

  def hit
    @symbol = :map
    "Miss"
  end
end
