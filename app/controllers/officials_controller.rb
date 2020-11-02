class OfficialsController < ApplicationController

  def index
    @officials = VoteSmart::Official.all
    render json: @officials
  end

  def by_zip
    @officials = VoteSmart::Official.get_by_zip params[:zip5]
    render json: @officials
  end

  def by_zip_full
    @officials = VoteSmart::Official.get_by_zip params[:zip5], nil, params[:zip4], nil
    render json: @officials
  end

end
