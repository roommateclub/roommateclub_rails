class User::ApartmentsController < User::BaseController
  before_action :set_apartment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @apartments = current_user.apartments
  end

  def show
  end

  def new
    @apartment = Apartment.new
  end

  def create
    @apartment = Apartment.register(apartment_params, current_user.id)
    @apartment.save
    respond_with(@apartment, location: user_apartment_path(@apartment))
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_apartment
    @apartment = Apartment.find(params[:id])
  end

  def apartment_params
    params[:apartment].permit([:discription, :is_landlord])
  end
end
