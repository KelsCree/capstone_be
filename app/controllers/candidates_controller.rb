class CandidatesController < ApplicationController

  def index
    @candidates = VoteSmart::Candidate.all
    render json: @candidates
  end

  def by_zip
    @candidates = VoteSmart::Candidate.get_by_zip params[:zip]
    render json: @candidates
  end

end
