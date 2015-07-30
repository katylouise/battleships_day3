class Ship

SHIP_TYPES = {test: 1, destroyer: 2,cruiser: 3, submarine: 3, battleship: 4, aircraft_carrier: 5 }

 def self.method_missing(method, *args, &block)
   return Ship.new(SHIP_TYPES[method]) if SHIP_TYPES.include?(method)
   super
 end

attr_reader :symbol, :size
attr_accessor :hit_count, :status

  def initialize(size)
    @symbol = 's'
    @size = size
    @hit_count = 0
    @status = :ready_to_place
  end

  def hit
    @hit_count += 1
    if hit_count >= size
      sunk
    else
      "Hit!"
    end
  end

  def sunk
    @status = :sunk
    "You have sunk my ship!"
  end

end
