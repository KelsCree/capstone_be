class ElectionsController < ApplicationController
  def index
    @elections = VoteSmart::Election.all
    render json: @elections
  end

  def by_zip
    @elections = VoteSmart::Election.get_by_zip params[:zip5]
    render json: @elections
  end

  def by_zip_full
    @elections = VoteSmart::Election.get_by_zip params[:zip5], params[:zip4]
    render json: @elections
  end

  def by_zip_9dig
    @elections = VoteSmart::Election.get_by_zip params[:zip5], params[:zip4]
    render json: @elections
  end
end
