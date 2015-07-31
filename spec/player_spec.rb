require 'player'

describe Player do
  let(:board) { double(:board, { ship_capacity: 5 }) }
  let(:ship) { double(:ship, { status: :sunk }) }

  before(:each) do
    allow(board).to receive(:place)
    subject.add_board(board)
  end

  it "can shoot at a location" do
    expect(subject).to respond_to(:shoot).with(2).argument
  end

  it "can store a shot" do
    new_board = Board.new
    subject.add_board(new_board)
    subject.shoot(new_board, 'A1')
    expect(subject.shots.keys).to include('A1')
  end

  it "can have a board" do
    expect(subject).to be_has_board
  end

  it "can place a ship" do
    subject.place(ship, 'A1', :horizontal)
    expect(subject.ships).not_to be_empty
  end

  it "can count number of sunk ships" do
    subject.place(ship, 'A1', :horizontal)
    expect(subject.number_ships_sunk).to eq(1)
  end

  it "can be a loser" do
    subject.place(ship, 'A1', :horizontal)
    expect(subject).to be_lost
  end
end
