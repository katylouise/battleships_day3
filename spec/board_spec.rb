require 'board'

describe Board do
  it "responds to board" do
    expect(subject).to respond_to(:display_grid)
  end
end
