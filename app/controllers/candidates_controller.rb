class CandidatesController < ApplicationController

  def by_zip
    @candidates = VoteSmart::Candidate.get_by_zip params[:zip]
    render json: @candidates
  end

end
