class RentCasesController < ApplicationController

  respond_to :html

  def index
    @rent_cases = RentCase.includes(:apartment).all
  end

  def show
    @rent_case = RentCase.find(params[:id]).includes(:apartment)
  end
end
