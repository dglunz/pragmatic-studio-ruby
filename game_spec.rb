require_relative 'game'

describe Game do
	
	before do 
		@game = Game.new("Adventure")

		@initial_health = 150
		@player = Player.new("Moe", @initial_health)
		@player2 = Player.new("Larry")

		@game.add_player(@player)
	end

	it "rolls a 5 or 6 heals" do
		allow_any_instance_of(Dice).to receive(:roll).and_return(5)
		@game.play

		expect(@player.health).to eq(@initial_health + 10)
	end

	it "rolls a 3 or 4 skips" do
		allow_any_instance_of(Dice).to receive(:roll).and_return(3)
		@game.play

		expect(@player.health).to eq(@initial_health)
	end

	it "rolls a 1 or 2 attacks" do
		allow_any_instance_of(Dice).to receive(:roll).and_return(1)
		@game.play

		expect(@player.health).to eq(@initial_health - 10)
	end

end