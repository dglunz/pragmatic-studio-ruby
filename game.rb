require_relative  'player'
class Game
  attr_accessor :title
  attr_reader :players
  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def play
    @players.each do |player|
      puts "#{player.name} has #{player.health} health"
    end
  end
end
