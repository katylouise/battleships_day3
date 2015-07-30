require 'player'

describe Player do
  player = Player.new

  it "can shoot at a location" do
    expect(player).to respond_to(:shoot).with(1).argument
  end

  it 'should have a default size' do
    expect(subject.board.size).to eq(Player::DEFAULT_BOARD_SIZE)
  end
end
