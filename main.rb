#main.rb - launchpad

require_relative 'game'
require_relative 'player'
require_relative 'question'


# create question

question = Question.new

# create players

player1 = Player.new
player2 = Player.new

# create game
game = Game.new player1, player2
game.start_game
