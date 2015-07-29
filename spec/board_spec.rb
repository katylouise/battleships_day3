require 'board'

describe Board do
  it "responds to board" do
    expect(subject).to respond_to(:display_grid)
  end

  it 'responds to place' do
    expect(subject).to respond_to(:place).with(2).argument
  end
end
