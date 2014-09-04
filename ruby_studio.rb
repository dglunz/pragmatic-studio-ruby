require_relative 'game'
knuckleheads = Game.new("Knuckleheads")
knuckleheads.load_players(ARGV.shift || "players.csv")

klutz = ClumsyPlayer.new("klutz", 150)
berserker = BerserkPlayer.new("berserker", 50)

knuckleheads.add_player(klutz)
knuckleheads.add_player(berserker)

loop do
puts "How many rounds would you like to play? ('quit' to exit)"
answer = gets.chomp.downcase
	case answer
	when /^\d+$/
		knuckleheads.play(answer.to_i) 
	when 'quit', 'exit'
		knuckleheads.print_stats
		knuckleheads.save("highscores.csv")
		break
	else
		puts "Please enter a number or 'quit' to exit"
	end
end
