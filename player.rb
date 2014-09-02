class Player
  attr_accessor :name
  attr_reader :health, :score
  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
  end

  def attack
    @health -= 10
  end

  def heal
    @health += 10
  end

  def score
    @score = @health + @name.length
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

  def to_s
    "#{@name} has a health of #{@health}"
  end
end
