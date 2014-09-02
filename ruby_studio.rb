require_relative 'game'
player1 = Player.new("Larry")
player2 = Player.new("moe")
knuckleheads = Game.new("Knuckleheads")

puts knuckleheads.title
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.play
knuckleheads.play
