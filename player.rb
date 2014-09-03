class Player
  attr_accessor :name
  attr_reader :health, :score
  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
    @found_treasures = Hash.new(0)
  end

  def found_treasure(treasure)
    @found_treasures[treasure.name] += treasure.gold_value
    puts "#{name} found #{treasure.name} worth #{treasure.gold_value}"
    puts "#{name}'s Inventory: #{@found_treasures}"
  end

  def attack
    @health -= 10
  end

  def heal
    @health += 10
  end

  def score
    @found_treasures.values.reduce(0, :+)
  end

  def strong?
    @health >= 150
  end

  def average?
    @health.between?(50, 150)
  end

  def weak?
    @health <= 50
  end

  def <=>(other)
    other.score <=> score
  end

  def to_s
    "#{@name}'s Health: #{@health}\n#{@name}'s Score: #{score}\n\n"
  end
end
