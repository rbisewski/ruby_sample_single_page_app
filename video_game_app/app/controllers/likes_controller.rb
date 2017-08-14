class LikesController < ApplicationController
  before_action :set_like, only: [:show]

  # GET /likes
  # GET /likes.json
  def index
    @likes = Like.all
  end

  # POST /likes#create
  def create
    @like = Like.new(like_params)
    respond_to do |format|
      if @like.save
        ApplicationMailer.send_email_as_game_was_liked(params).deliver
        format.html { head :no_content }
        format.json { head :no_content }
      else
        format.html { head :no_content }
        format.json { head :no_content }
      end
    end
  end

  private

    #
    # Use callbacks to share common setup or constraints between actions.
    #
    def set_like
      @like = Like.find(params[:id])
    end

    #
    # Define the params needed for a game entry.
    #
    def like_params
      params.permit(:game_id, :datetime, :ip)
    end
end
