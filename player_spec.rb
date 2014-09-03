require_relative 'player'

describe Player do
  before do
    @player = Player.new("larry", 150)
    @starting_health = @player.health
  end

  it "yields each found treasure and its total points" do
    @player.found_treasure(Treasure.new(:skillet, 100))
    @player.found_treasure(Treasure.new(:skillet, 100))
    @player.found_treasure(Treasure.new(:hammer, 50))
    @player.found_treasure(Treasure.new(:bottle, 5))
    @player.found_treasure(Treasure.new(:bottle, 5))
    @player.found_treasure(Treasure.new(:bottle, 5))
    @player.found_treasure(Treasure.new(:bottle, 5))
    @player.found_treasure(Treasure.new(:bottle, 5))
    
    yielded = []
    @player.each_found_treasure do |treasure|
      yielded << treasure
    end
    
    expect(yielded).to eq([
      Treasure.new(:skillet, 200), 
      Treasure.new(:hammer, 50), 
      Treasure.new(:bottle, 25)
   ])
  end

  it "has a capitalized name" do
    expect(@player.name).to eq("Larry")
  end

  it "has an initial health" do
    expect(@player.health).to eq(@starting_health)
  end

  it "has a string representation" do
    expect(@player.to_s).to eq("Larry's Health: 150\nLarry's Score: 0\n\n")
  end

  it "computes points as the sum of all treasure value" do
    expect(@player.score).to eq(0)
    @player.found_treasure(Treasure.new(:crown, 500))
    expect(@player.score).to eq(500)
    @player.found_treasure(Treasure.new(:necklace, 100))
    expect(@player.score).to eq(600)
    @player.found_treasure(Treasure.new(:broken_axe, 1))
    expect(@player.score).to eq(601)
  end

  it "increases health by 10 when healed" do
    @player.heal
    expect(@player.health).to eq(@starting_health + 10)
  end
  
  it "decreases health by 10 when attacked" do
    @player.attack
    expect(@player.health).to eq(@starting_health - 10)
  end

    context "with player health equal to or above 150" do
      before do
        @player = Player.new("larry", 150)
      end
      it "is strong" do
        expect(@player.strong?).to eq(true)
      end
    end

    context "with player health bewteen 50 and 150" do
      before do
        @player = Player.new("larry", 100)
      end
      it "is average" do
        expect(@player.average?).to eq(true)
      end
    end

    context "with player health equal to or below 50" do
      before do
        @player = Player.new("larry", 50)
      end
      it "is weak" do
        expect(@player.weak?).to eq(true)
      end
    end
end
