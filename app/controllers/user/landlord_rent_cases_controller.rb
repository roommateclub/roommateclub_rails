class User::LandlordRentCasesController < User::BaseController
  before_action :set_landlord_rent_case, only: [:show, :edit, :update, :destroy]
  # before_action :set_apartment, except: [:index]

  respond_to :html

  def index
    @landlord_rent_cases = current_user.landlord_rent_cases.all
    respond_with(@landlord_rent_cases)
  end

  def show
    respond_with(@landlord_rent_case)
  end

  def new
    @landlord_rent_case = current_user.landlord_rent_cases.build
    if params[:apartment_id].present? 
      @apartment = Apartment.find(params[:apartment_id])
      @update_apartment = true
    else
      @apartment = @landlord_rent_case.build_apartment
    end
  end

  def create
    @landlord_rent_case = current_user.landlord_rent_cases.build(landlord_rent_case_params)
    if @landlord_rent_case.save
      @landlord_rent_case.update(apartment_id: params[:apartment_id]) if params[:apartment_id].present?
      respond_with(@landlord_rent_case, location: user_apartment_path(@landlord_rent_case.apartment.id))
    end 
  end

  def edit
    @apartments = current_user.apartments
  end

  def update
    @landlord_rent_case.update(landlord_rent_case_params)
    respond_with(@landlord_rent_case, location: user_rent_cases_path)
  end

  def destroy
    @landlord_rent_case.destroy
    respond_with(@landlord_rent_case, location: user_rent_cases_path)
  end

  private
  def set_landlord_rent_case
    @landlord_rent_case = landlordRentCase.find(params[:id])
  end

  # def set_apartment
  #   @apartment = Apartment.find(params[:apartment_id])
  # end

  # def create_with_current_apartment
  #   landlord_rent_case = current_user.build()
  # end

  def landlord_rent_case_params
    params[:landlord_rent_case].permit!
  end
end
