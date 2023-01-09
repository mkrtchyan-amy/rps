module RPS
  class SystemPlayer

    def play
      Curb.new.play
    rescue Errors::GameApiError
      play_locally
    end

    private

    def play_locally
      Game::PLAY_OPTIONS.sample
    end
  end
end
