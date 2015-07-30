require 'player'

describe Player do
  let(:board) { double(:board, { ship_capacity: 5 }) }
  let(:ship) { double(:ship, { status: :sunk }) }

  it "can shoot at a location" do
    expect(subject).to respond_to(:shoot).with(1).argument
  end

  it "can have a board" do
    subject.add_board(board)
    expect(subject).to be_has_board
  end

  it "can be a loser" do
    allow(board).to receive(:place)
    subject.add_board(board)
    subject.place(ship, 'A1', :horizontal)
    expect(subject).to be_lost
  end
end
