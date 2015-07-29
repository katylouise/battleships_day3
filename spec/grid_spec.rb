require 'grid'

describe Grid do
  it 'responses to #matrix builder' do
    expect(subject).to respond_to(:matrix_builder)
  end

  it 'should create default size matrix' do
    expect(subject.matrix.length).to eq(Grid::DEFAULT_SIZE)
  end

  it 'first element should be eqaul to default size' do
    expect(subject.matrix[0].length).to eq(Grid::DEFAULT_SIZE)
  end
end
