require 'cell'

describe Cell do
  let(:ship){ double(:ship) }
  let(:player){ double(:player) }

  it "is unique" do
    expect(subject.content).not_to eq(Cell.new.content)
  end

  it 'should put a ship in the cell' do
    subject.change_contents(ship)
    expect(subject.content).to eq(ship)
  end

  it "should not contain more than one ship" do
    subject.content = ship
    expect{ subject.change_contents(ship) }.to raise_error "Occupied"
  end

  it "should be hit when fired at" do
    subject.hit
    expect(subject).to be_hit
  end
end
