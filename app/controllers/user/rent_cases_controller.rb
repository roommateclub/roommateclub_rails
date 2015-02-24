class User::RentCasesController < User::BaseController
  before_action :set_rent_case, only: [:show, :edit, :update, :destroy]
  before_action :set_apartment, except: [:index]

  respond_to :html

  def index
    @rent_cases = current_user.rent_cases.all
    respond_with(@rent_cases)
  end

  def show
    respond_with(@rent_case)
  end

  def new
    @rent_case = @apartment.rent_cases.build
    respond_with(@rent_case)
  end

  def create
    @rent_case = @apartment.rent_cases.build(rent_case_params)
    if @rent_case.save
      @rent_case.update(landlord: current_user)
      respond_with(@rent_case, location: user_apartment_path(@apartment))
    end 
  end

  def edit
    @apartments = current_user.apartments
  end

  def update
    @rent_case.update(rent_case_params)
    respond_with(@rent_case, location: user_rent_cases_path)
  end

  def destroy
    @rent_case.destroy
    respond_with(@rent_case, location: user_rent_cases_path)
  end

  private
  def set_rent_case
    @rent_case = RentCase.find(params[:id])
  end

  def set_apartment
    @apartment = Apartment.find(params[:apartment_id])
  end

  def rent_case_params
    params[:rent_case].permit!
  end
end
