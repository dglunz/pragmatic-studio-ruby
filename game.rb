require_relative 'player'
require_relative 'fight'
require_relative 'treasure'

class Game
  attr_accessor :title
  attr_reader :players
  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def play(rounds)
    puts "#{@title} Players: "
    puts @players
    1.upto(rounds) do |count|
      if block_given?
        break if yield
      end
      puts "\nRound #{count}: "
      @players.each do |player|
        Fight.take_turn(player)
      end
    end
  end

  def total_points
    @players.reduce(0) { |sum, player| sum + player.score }
  end

  def print_stats
    puts "\n#{@title} Stats:\n\n"
    @players.sort.each do |player|
      formatted_name = player.name.center(25, '.')
      puts "#{formatted_name}"
      player.each_found_treasure do |treasure|
        formatted_treasure = treasure.name.to_s.ljust(20, '.')
        puts "#{formatted_treasure} #{treasure.gold_value}"
      end
      total = "Total".ljust(20, '.')
      puts "#{total} #{player.score}"
    end
  end

  def load_players(file)
    File.readlines(file).each do |line|
      name, health = line.split(",")
      player = Player.new(name, health.to_i)
      add_player(player)
    end
  end

  def save(to_file)
    File.open(to_file, "w") do |file|
      file.puts print_stats
    end
  end

end
