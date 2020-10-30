class VotesController < ApplicationController

  def vote_categories
    @vote_categories = VoteSmart::Vote.get_categories params[:year], params[:stateId]
    render json: @vote_categories
  end

end
