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
    
  end
  it "decreases health by 10 when attacked"

end
