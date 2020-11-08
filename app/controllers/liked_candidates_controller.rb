class LikedCandidatesController < ApplicationController

  def index
    @liked_candidates = Liked_Candidate.all
    render json: @liked_candidates
  end

  def show
    @liked_candidate = Liked_Candidate.find(params[:id])
    render json: @liked_candidate
  end

  def create
    @liked_candidate = Liked_Candidate.create(
      user: @user.id,
      params[:cand_id]
    )
    render json: @liked_candidate
  end

  def destroy
    @liked_candidate = Liked_Candidate.find(params[:id])
    @liked_candidate.destroy
    render json: 'Candidate has been unliked.'
  end
end
