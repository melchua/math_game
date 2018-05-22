class Player
  LIVES = 3
  attr_accessor :lives
  def initialize
    # @player_number = player_number
    @lives = LIVES
  end

  def loss_of_life
    @lives = @lives - 1
  end

end

