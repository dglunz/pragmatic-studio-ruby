require_relative 'player'

describe Player do
  before do
    @player = Player.new("larry", 150)
    @starting_health = @player.health
  end

  it "has a capitalized name" do
    expect(@player.name).to eq("Larry")
  end

  it "has an initial health" do
    expect(@player.health).to eq(@starting_health)
  end

  it "has a string representation" do
    expect(@player.to_s).to eq("Larry has a health of 150")
  end

  it "computes a score as health + name length" do
    expect(@player.score).to eq(155)
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
