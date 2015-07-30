require 'grid'

describe Grid do
  let(:cell) { double(:cell) }
  it 'responds to matrix_builder' do
    expect(subject).to respond_to(:matrix_builder)
  end

  it 'should create a default size matrix' do
    expect(subject.matrix.length).to eq(Grid::DEFAULT_SIZE)
  end

  it 'the first row should be equal to the default size' do
    expect(subject.matrix[0].length).to eq(Grid::DEFAULT_SIZE)
  end

  it 'should create a populated matrix' do
    expect(subject.matrix[0]).not_to be_empty
  end

  it 'should create different cells' do
    expect(subject.matrix[0][0]).not_to eq(subject.matrix[0][1])
  end

  it 'should find a cell given number coordinates' do
    expect(subject.find_cell([0, 0])).to respond_to(:content)
  end
end
