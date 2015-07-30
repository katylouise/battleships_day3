require 'player'

describe Player do
  let(:board) { double(:board) }
  it "can shoot at a location" do
    expect(subject).to respond_to(:shoot).with(1).argument
  end

  it "can have a board" do
    subject.add_board(board)
    expect(subject).to be_has_board
  end
end
