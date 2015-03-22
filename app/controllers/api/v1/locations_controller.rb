class Api::V1::LocationsController < ApplicationController
  respond_to :json

  def districts_index
    respond_with City.find(params[:city_id]).districts
  end
end
