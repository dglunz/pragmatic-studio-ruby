Treasure = Struct.new(:name, :gold_value)

module TreasureBox
  TREASURES = [
    Treasure.new(:crown, 500),
    Treasure.new(:necklace, 100),
    Treasure.new(:broken_axe, 1),
  ]
  def self.random
    TREASURES.sample
  end
end
