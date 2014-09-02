require_relative 'game'
player1 = Player.new("Larry")
player1.attack
player1.heal
player1.heal
knuckleheads = Game.new("Knuckleheads")

puts knuckleheads.title
knuckleheads.add_player(player1)
knuckleheads.play
