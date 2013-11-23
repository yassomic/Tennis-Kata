module Tennis
  class Game
    attr_accessor :player1, :player2

    def initialize
      @player1 = Player.new
      @player2 = Player.new

      @player1.opponent = @player2
      @player2.opponent = @player1
    end

    # Records a win for a ball in a game.
    #
    # winner - The Integer (1 or 2) representing the winning player.
    #
    # Returns the score of the winning player. 
    def wins_ball(winner)
      @player1.points = winner
      # TODO: Think it's gross to pass an integer instead of a player object?
      # Then reimplement this method!
    end

    def duece
      if @player1.points >= 3 && @player1.points = @player2.points
        return "duece"
      elsif @player2.points >= 3 && @player2.points = @player1.points
        return "duece"
      else
        return "there is no duece"
      end
    end

    def advantage
      if @player1.points >= 4 && @player1.points - 1 === @player2.points
        return "advantage, player 1"
      elsif @player2.points >= 4 && @player2.points - 1 === @player1.points
        return "advantage, player 2"
      else
        return "there is no advantage"
      end
    end

    def win_game
      if @player1.points >= 4 && @player1.points - 2 >= @player2.points
         return "player1 wins"
      elsif @player2.points >= 4 && @player2.points - 2 >= @player1.points
         return "player2 wins"
      else
        return "Noone has won the game yet."
      end
    end
  end

  class Player
    attr_accessor :points, :opponent

    def initialize
      @points = 0
    end

    # Increments the score by 1.
    #
    # Returns the integer new score.
    def record_won_ball!
      @points += 1
    end

    # Returns the String score for the player.
    def score
      return 'love' if @points == 0
      return 'fifteen' if @points == 1
      return 'thirty' if @points == 2
      return 'forty' if @points == 3
    end
  end
end