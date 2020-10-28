class OfficesController < ApplicationController

  def index
    @offices = VoteSmart::Office.all
    render json: @offices
  end
end
