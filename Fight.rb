require_relative 'dice'
require_relative 'treasure'
module Fight
	attr_reader :die
	def self.take_turn(player)
		loot = TreasureBox.random
		die = Dice.new
    	num_rolled = die.roll
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
		puts "#{player.name} found a #{loot.name}, worth #{loot.gold_value}"
		puts player
	end
end
