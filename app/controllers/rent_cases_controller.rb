class RentCasesController < ApplicationController

  respond_to :html

  def index
    @rent_cases = RentCase.includes(:apartment).all
  end

  def show
    @rent_case = RentCase.includes(:apartment).find(params[:id])
    @groups = @rent_case.groups
    @user_groups = current_user.groups
    @pin = @rent_case.pins.build
  end
end
