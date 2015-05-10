class User::ApartmentsController < User::BaseController
  before_action :set_apartment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @apartments = current_user.apartments.includes(:rent_cases)
  end

  def show
    @images = @apartment.images
  end

  def new
    @apartment = current_user.apartments.new
    @city = City.new
    @address = @apartment.build_address
    @new_image = @apartment.images.build
    @cities = City.all.map{ |city| [city.name, city.id] }
  end

  def create
    @apartment = current_user.apartments.build(apartment_params)
    if @apartment.save
      respond_with(@apartment, location: user_apartment_path(@apartment))
    else
      render :new
    end
  end

  def edit
    @address = @apartment.address
    @city = @address.city
    @districts = @city.districts
    @cities = City.all.map{ |city| [city.name, city.id] }
    @images = @apartment.images
    @new_image = Image.new
  end

  def update
    if @apartment.update(apartment_params)
      respond_with(@apartment, location: user_apartment_path(@apartment))
    else
      @address = @apartment.address
      @city = @address.city
      @districts = @city.districts
      @cities = City.all.map{ |city| [city.name, city.id] }
      render :edit
    end
  end

  def destroy
  end

  private

  def set_apartment
    @apartment = Apartment.find(params[:id])
  end

  def apartment_params
    params[:apartment].permit(:discription, :is_landlord, image_ids: [],
      address_attributes: [:city_id, :district_id, :street])
  end
end
