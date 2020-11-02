class CandidatesController < ApplicationController

  def index
    @candidates = VoteSmart::Candidate.all
    render json: @candidates
  end

  def by_zip
    @candidates = VoteSmart::Candidate.get_by_zip params[:zip]
    render json: @candidates
  end

  def by_zip_full
    @candidates = VoteSmart::Candidate.get_by_zip params[:zip5], nil, params[:zip4], nil
    render json: @candidates
  end

  def bio
    @candidate_bio = VoteSmart::CandidateBio.get_bio params[:can_id]
    render json: @candidate_bio
  end

end
