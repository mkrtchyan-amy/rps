module RPS
  class SystemPlayer

    def play
      # Add ':hammer' with 25% probability as Curb API doesn't support the 'hammer' move
      probable_moves = Array.new(3, system_move)
      probable_moves.insert(rand(3), :hammer)

      probable_moves.sample
    end

    private

    def system_move
      Curb.new.play
    rescue Errors::GameApiError => e
      Rails.logger.debug e.message
      play_locally
    end

    def play_locally
      Game::PLAY_OPTIONS.sample
    end
  end
end
