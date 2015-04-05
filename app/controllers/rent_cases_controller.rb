class RentCasesController < ApplicationController

  respond_to :html

  def index
    @rent_cases = RentCase.includes(:apartment).all
  end

  def show
    @rent_case = RentCase.find(params[:id])
    if @rent_case.type == "LandlordRentCase"
      @groups = @rent_case.groups
      render template: "rent_cases/landlord_case"
    else
      @group = @rent_case.group
      render template: "rent_cases/tenant_case"
    end
  end
end
