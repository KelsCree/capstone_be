class LikedCandidatesController < ApplicationController

  def index
    @liked_candidates = LikedCandidate.all
    render json: @liked_candidates
  end

  def show
    @liked_candidate = LikedCandidate.find(params[:id])
    render json: @liked_candidate
  end

  def create
    @liked_candidate = LikedCandidate.create(
      user_id: params[:user_id],
      cand_id: params[:cand_id]
    )
    render json: @liked_candidate
  end

  def destroy
    @liked_candidate = LikedCandidate.find(params[:id])
    @liked_candidate.destroy
    render json: 'Candidate has been unliked.'
  end
end
