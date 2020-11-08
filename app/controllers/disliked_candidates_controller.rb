class DislikedCandidatesController < ApplicationController

  def index
    @disliked_candidates = Disliked_Candidate.all
    render json: @disliked_candidates
  end

  def show
    @disliked_candidate = Disliked_Candidate.find(params[:id])
    render json: @disliked_candidate
  end

  def create
    @disliked_candidate = Disliked_Candidate.create(
      user: @user.id,
      params[:cand_id]
    )
    render json: @disliked_candidate
  end

  def destroy
    @disliked_candidate = Disliked_Candidate.find(params[:id])
    @disliked_candidate.destroy
    render json: 'Candidate has been unliked.'
  end
end

