require 'cell'

describe Cell do
  let(:ship){double(:ship)}

  it 'is different than other cells' do
    expect(subject.content).not_to eq(Cell.new.content)
  end

  # it 'is able to change content' do
  #   subject.add_ship(ship)
  #   subject.content
  # end
end
