require 'cell'

describe Cell do
  let(:ship){double(:ship)}

  it 'is different than other cells' do
    expect(subject.content).not_to eq(Cell.new.content)
  end

  xit 'is able to change content' do
    subject.add_ship

  end
end
