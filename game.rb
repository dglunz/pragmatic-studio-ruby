require_relative 'player' 
require_relative 'dice'
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
    die = Dice.new
    num_rolled = die.roll
    @players.each do |player|
      case num_rolled
        when 1..2
          player.attack
          "#{player.name} rolled a #{num_rolled}. Attacked"
        when 3..4
          "#{player.name} rolled a #{num_rolled}. Skipped"
        when 5..6
          player.heal 
          "#{player.name} rolled a #{num_rolled}. Healed"
      end
      puts "#{player.name} has #{player.health} health"
    end
  end
end
