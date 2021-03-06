require 'ship'

describe Ship do
    ship = Ship.destroyer
    it 'contains ship symbol' do
      expect(ship.symbol).to eq('s')
    end

    it "is a destroyer size 2" do
      destroyer = described_class.destroyer
      expect(destroyer.size).to eq 2
    end

    it "is a cruiser size 3" do
      cruiser = described_class.cruiser
      expect(cruiser.size).to eq 3
    end

    it "is a submarine size 3" do
      submarine = described_class.submarine
      expect(submarine.size).to eq 3
    end

    it "is a battleship size 4" do
      battleship = described_class.battleship
      expect(battleship.size).to eq 4
    end

    it "is aircraft_carrier size 5" do
      aircraft_carrier = described_class.aircraft_carrier
      expect(aircraft_carrier.size).to eq 5
    end

    it "raises error if valid ship not given" do
      expect{ described_class.not_valid }.to raise_error(NameError)
    end

    it "knows when it has sunk" do
      ship.size.times{ ship.hit }
      expect(ship.status).to eq(:sunk)
    end

    it "gives a message when ship has sunk" do
      ship.hit
      expect(ship.hit).to eq("You have sunk my ship!")
    end
end
