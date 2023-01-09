module RPS
  module Errors
    class GameApiError < StandardError; end
    class InvalidMoveError < StandardError; end
  end
end
