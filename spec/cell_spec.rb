require 'cell'

describe Cell do
  let(:ship){ double(:ship, { status: :ready_to_place }) }
  let(:player){ double(:player) }

  it "is unique" do
    expect(subject.content).not_to eq(Cell.new.content)
  end

  describe "#change_contents" do
    it 'should put a ship in the cell' do
      expect(ship).to receive(:status=).with(:afloat)
      subject.change_contents(ship)
    end

    it "should not contain more than one ship" do
      subject.content = ship
      expect{ subject.change_contents(ship) }.to raise_error "Occupied"
    end
  end

  it "should be hit when fired at" do
    subject.hit
    expect(subject).to be_hit
  end
end
