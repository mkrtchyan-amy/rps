class GameController < ApplicationController

  def index; end

  def play
    @result, @system_move = RPS::Game.new(params[:move]).play
    render 'play', layout: nil
  end
end
