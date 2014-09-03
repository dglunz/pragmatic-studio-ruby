require_relative 'treasure'

describe Treasure do
  before do
    @treasure = Treasure.new(:crown, 500)
  end

  it "has a name attribute" do
    expect(@treasure.name).to eq(:crown)
  end

  it "has a gold value" do
    expect(@treasure.gold_value).to eq(500)
  end

end

describe TreasureBox do
  it "has 3 treasures" do
    expect(TreasureBox::TREASURES.size).to eq(3)
  end
  it "has a crown worth 500 gold" do
    expect(TreasureBox::TREASURES[0]).to eq(Treasure.new(:crown, 500))
  end
  it "has a necklace worth 100 gold" do
    expect(TreasureBox::TREASURES[1]).to eq(Treasure.new(:necklace, 100))
  end
  it "has a broken axe worth 1 gold" do
    expect(TreasureBox::TREASURES[2]).to eq(Treasure.new(:broken_axe, 1))
  end
  it "returns a random treasure" do
    treasure = TreasureBox.random

    expect(TreasureBox::TREASURES).to include(treasure)
  end
end
