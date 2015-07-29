require_relative 'board'

class Game
  attr_reader :players
  attr_accessor :board

  def initialize
    @players = []
    @board = board
  end

  def add_player(player)
    players << player
  end

end