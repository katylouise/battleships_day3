require 'grid'

describe Grid do
  let(:cell) { double(:cell) }
  grid = Grid.new 10

  it 'responds to matrix_builder' do
    expect(grid).to respond_to(:matrix_builder)
  end

  it 'should create a matrix of the specified size' do
    expect(grid.matrix.length).to eq(10)
  end

  it 'the first row should be equal to the matrix size' do
    expect(grid.matrix[0].length).to eq(10)
  end

  it 'should create a populated matrix' do
    expect(grid.matrix[0]).not_to be_empty
  end

  it 'should create different cells' do
    expect(grid.matrix[0][0]).not_to eq(grid.matrix[0][1])
  end

  it 'should find a cell given number coordinates' do
    expect(grid.find_cell([0, 0])).to respond_to(:content)
  end
end
