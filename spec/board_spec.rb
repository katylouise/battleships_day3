require 'board'

describe Board do
  let(:ship) { double(:ship, { size: 2 }) }
  it "responds to board" do
    expect(subject).to respond_to(:display_grid)
  end

  it 'responds to place' do
    expect(subject).to respond_to(:place).with(2).argument
  end

  it 'converts coordinates' do
    expect(subject.coordinate_converter('D10')).to eq([3, 9])
  end

  it 'gives an error if ship will be placed off grid' do
    allow(ship).to receive(:destroyer)
    expect{subject.place(ship, 'A10')}.to raise_error "Your ship is off the grid"
  end
end
