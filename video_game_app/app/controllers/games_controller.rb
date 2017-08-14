class GamesController < ApplicationController
  before_action :set_game, only: [:show]

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
  end

  private

    #
    # Use callbacks to share common setup or constraints between actions.
    #
    def set_game
      @game = Game.find(params[:id])
    end

    #
    # Define the params needed for a game entry.
    #
    def game_params
      params.require(:game).permit(:image, :name, :year, :manufacturer, :notes, :is_active)
    end
end
