#game.rb - we are making the assumption that current player is first player in array
require_relative 'question'
require_relative 'player'


class Game
  def initialize(player1, player2)
    @current_player_index = 0
    @players = [player1, player2]
    @question = Question.new
    @alive = true
  end

  def start_game
    while all_alive? == true do
      @question.generate_question
      puts "Player #{@current_player_index + 1}: #{@question.ask_question}"
      print "> "
      input = gets.chomp

      if @question.evaluate_question(input.to_i) == true
        puts "YES! You are correct."
      else
        @players[@current_player_index].loss_of_life
        puts "Seriously? No!"
      end

      @players[@current_player_index].lives > 0 ? print_score : print_winner
      toggle_current_player
    end
  end

  def toggle_current_player
    @current_player_index = (@current_player_index + 1) % 2
  end

  def all_alive?
    @players.each do |player|
        if player.lives == 0
          @alive = false
        end
    end
    @alive
  end

  def print_score
    @players.each_with_index { |player, index| print "P#{index+1} (#{player.lives}/3) "}
    puts "\n----- NEW TURN -----"
  end

  def print_winner
    puts "----- GAME OVER -----"
    if @players[@current_player_index].lives > 0
      puts "#{@current_player_index + 1} wins with a score of #{@players[@current_player_index].lives}/3"
      puts "Goodbye!!!!!!!!!!"
    end
  end
end
