require 'water'

describe Water do
  it "has a variable water which has a graphical representation of water" do
    expect(subject.water).to eq(:~)
  end
end