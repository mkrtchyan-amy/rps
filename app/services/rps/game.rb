module RPS
  class Game

    attr_reader :player_move
    attr_reader :system_move

    PLAY_OPTIONS = %i[rock paper scissors hammer].freeze
    ROCK_BEATS =  %i[scissors].freeze
    SCISSORS_BEATS =  %i[paper].freeze
    PAPER_BEATS =  %i[rock hammer].freeze
    HAMMER_BEATS =  %i[rock scissors].freeze

    BEATS = {
      rock: ROCK_BEATS,
      paper: PAPER_BEATS,
      scissors: SCISSORS_BEATS,
      hammer: HAMMER_BEATS
    }.freeze

    def initialize(player_move)
      @player_move = player_move.to_sym
    end

    def play
      validate_player_move!
      @system_move = SystemPlayer.new.play

      [game_result, @system_move]
    end

    private

    PLAY_OPTIONS.each do |option|
      define_method("#{option}_wins?") do
        BEATS[option].include?(@system_move)
      end
    end

    def validate_player_move!
      return if PLAY_OPTIONS.include?(@player_move)

      raise Errors::InvalidMoveError
    end

    def game_result
      return 'TIED' if @player_move == @system_move

      send("#{@player_move}_wins?") ? 'WON' : 'LOST'
    end
  end
end
