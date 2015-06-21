class User::RentCasesController < User::BaseController
  before_action :set_rent_case, only: [:show, :edit, :update, :destroy]
  # before_action :set_apartment, except: [:index]

  respond_to :html

  def index
    @rent_cases = current_user.rent_cases.all
    respond_with(@rent_cases)
  end

  def show
    respond_with(@rent_case)
  end

  def new
    @rent_case = current_user.rent_cases.build
    if params[:apartment_id].present? 
      @apartment = Apartment.find(params[:apartment_id])
      @update_apartment = true
    else
      @apartment = @rent_case.build_apartment
    end
  end

  def create
    @rent_case = current_user.rent_cases.build(rent_case_params)
    if @rent_case.save
      @rent_case.update(apartment_id: params[:apartment_id]) if params[:apartment_id].present?
      respond_with(@rent_case, location: user_apartment_path(@rent_case.apartment.id))
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

  # def set_apartment
  #   @apartment = Apartment.find(params[:apartment_id])
  # end

  # def create_with_current_apartment
  #   rent_case = current_user.build()
  # end

  def rent_case_params
    params[:rent_case].permit!
  end
end
