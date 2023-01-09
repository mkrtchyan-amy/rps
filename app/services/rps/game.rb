module RPS
  class Game
    attr_reader :player_move
    attr_reader :system_move

    PLAY_OPTIONS = %w[rock paper scissors].freeze

    def initialize(player_move)
      @player_move = player_move
    end

    def play
      validate_player_move!
      @system_move = SystemPlayer.new.play

      [game_result, @system_move]
    end

    private

    def validate_player_move!
      return if PLAY_OPTIONS.include?(@player_move)

      raise Errors::InvalidMoveError
    end

    def rock_wins?
      @system_move == 'scissors'
    end

    def paper_wins?
      @system_move == 'rock'
    end

    def scissors_wins?
      @system_move == 'paper'
    end

    def game_result
      return 'TIED' if @player_move == @system_move

      send("#{@player_move}_wins?") ? 'WON' : 'LOST'
    end
  end
end
