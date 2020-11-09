class DislikedCandidatesController < ApplicationController

  def index
    @disliked_candidates = DislikedCandidate.all
    render json: @disliked_candidates
  end

  def show
    @disliked_candidate = DislikedCandidate.find(params[:id])
    render json: @disliked_candidate
  end

  def create
    @disliked_candidate = DislikedCandidate.create(
      user_id: params[:user_id],
      cand_id: params[:cand_id]
    )
    render json: @disliked_candidate
  end

  def destroy
    @disliked_candidate = DislikedCandidate.find(params[:id])
    @disliked_candidate.destroy
    render json: 'Candidate has been unliked.'
  end
end

