require_relative 'clumsy_player'

describe ClumsyPlayer do
	before do
		@player = ClumsyPlayer.new("klutz")
	end

	it "only gets half the gold value for each treasure" do
		expect(@player.score).to eq(0)
		hammer = Treasure.new(:hammer, 50)
		@player.found_treasure(hammer)
		@player.found_treasure(hammer)
		@player.found_treasure(hammer)

		expect(@player.score).to eq(75)

		yielded = []

		@player.each_found_treasure do |treasure|
	      yielded << treasure
	    end

    	expect(yielded).to eq([Treasure.new(:hammer, 75)])
    end
end