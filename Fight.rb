require_relative 'dice'
module Fight
	attr_reader :die
	def self.take_turn(player)
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
	end
end