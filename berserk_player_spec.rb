require_relative 'berserk_player'

describe BerserkPlayer do
	before do
		@initial_health = 150
		@player = BerserkPlayer.new("berserker", @initial_health)
	end

	it "does not go berserk when healed up to 5 times" do 
		1.upto(5) { @player.heal }

		expect(@player.berserk?).to be_falsey
	end

	it "goes berserk when healed more than 5 times" do
		1.upto(6) { @player.heal }

		expect(@player.berserk?).to be_truthy
	end

	it "gets healed instead of attacked when it's gone berserk" do  
	    1.upto(6) { @player.heal }
	    1.upto(2) { @player.attack }
	    
	    expect(@player.health).to eq(@initial_health + (3 * 15) + (5 * 10))
  	end

end