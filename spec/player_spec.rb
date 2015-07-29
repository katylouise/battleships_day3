require 'player'

describe Player do
  player = Player.new("Rebecca")

  it "can shoot at a location" do
    expect(player).to respond_to(:shoot).with(1).argument
  end
end