require 'game'

describe Game do

  let(:board){ double(:board) }
  let(:player){ double(:player) }

  it "can add players to the game" do
    subject.add_player(player)
    expect(subject.players).not_to be_empty
  end

end