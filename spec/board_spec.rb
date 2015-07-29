require 'board'

describe Board do
  let(:ship) { double(:ship, { size: 2 }) }
  it "responds to display_grid" do
    expect(subject).to respond_to(:display_grid)
  end

  it 'converts coordinates' do
    expect(subject.coordinate_converter('D10')).to eq([3, 9])
  end

  describe "#place" do
    it 'responds to place' do
      expect(subject).to respond_to(:place).with(2).argument
    end

    it 'gives an error if attempts to place northerly ship on grid' do
      allow(ship).to receive(:destroyer)
      expect{subject.place(ship, 'A10')}.to raise_error "Your ship is off the grid"
    end

    it 'gives an error if attempts to place southerly ship on grid' do
      allow(ship).to receive(:destroyer)
      expect{subject.place(ship, 'A1', :south)}.to raise_error "Your ship is off the grid"
    end

    it 'gives an error if attempts to place easterly ship on grid' do
      allow(ship).to receive(:destroyer)
      expect{subject.place(ship, 'A1', :east)}.to raise_error "Your ship is off the grid"
    end

    it 'gives an error if attempts to place northerly ship on grid' do
      allow(ship).to receive(:destroyer)
      expect{subject.place(ship, 'J10', :west)}.to raise_error "Your ship is off the grid"
    end
  end
end
