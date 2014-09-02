require_relative 'player' 
require_relative 'fight'
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

  def play(rounds)
    puts "#{@title} Players: "
    puts @players
    1.upto(rounds) do |count|
      puts "\nRound #{count}: "
      @players.each do |player|
        Fight.take_turn(player)
        puts player
      end
    end
  end

  def print_stats
    puts "\n#{@title} Stats:"
  end
  
end
