require 'cell'

describe Cell do
  it 'is different than other cells' do
    expect(subject.content).not_to eq(Cell.new.content)
  end
end
