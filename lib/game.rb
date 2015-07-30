require_relative 'board'
require_relative 'player'
require_relative 'ship'

class Game
  attr_reader :players
  attr_accessor :board

  def initialize
    @players = []
    @board = board
  end

  def start(player, board)
    players << player
    player.add_board(board)
  end

  def add_player(player)
    players << player
  end
end