require_relative 'player'

class BerserkPlayer < Player
	def initialize(name, health=150)
		super(name, health)
		@num_heals = 0
	end

	def heal
		@num_heals += 1
		if berserk?
			puts "#{@name} is berserk!"
			@health += 15
		else
			super
		end
	end

	def attack
		if berserk?
			puts "#{@name} is berserk!"
			@health += 15
		else
			super
		end
	end

	def berserk?
		@num_heals > 5
	end

end

if __FILE__ == $0
  berserker = BerserkPlayer.new("berserker", 50)
  6.times { berserker.heal }
end