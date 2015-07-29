require 'cell'

describe Cell do
  let(:ship){ double(:ship) }

  it 'is different than other cells' do
    expect(subject.content).not_to eq(Cell.new.content)
  end

  it 'shouldn\'t allow to have more than one content per cell' do
    subject.content = ship
    expect{ subject.change_contents(ship) }.to raise_error("Occupied")
  end
end
