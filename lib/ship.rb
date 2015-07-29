class Ship

SHIP_TYPES = {destroyer: 2,cruiser: 3, submarine: 3, battleship: 4, aircraft_carrier: 5 }

 def self.method_missing(method, *args, &block)
   return Ship.new(SHIP_TYPES[method]) if SHIP_TYPES.include?(method)
   super
 end

attr_reader :ship_symbol, :size

  def initialize(size)
    @ship_symbol = :s
    @size = size
  end
end
