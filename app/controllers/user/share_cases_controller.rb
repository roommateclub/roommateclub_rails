class User::ShareCasesController < User::BaseController
  before_action :set_share_case, only: [:show, :edit, :update, :destroy]
  # before_action :set_apartment, except: [:index]

  respond_to :html

  def index
    @share_cases = current_user.share_cases.includes(:apartment).all
    respond_with(@share_cases)
  end

  def show
    @tenant_group = @share_case.tenant_group
    @pending_list = @tenant_group.user_group_ships.where(state: "pending")
    @approved_list = @tenant_group.user_group_ships.where(state: "approved")
    respond_with(@share_case)
  end

  def new
    @share_case = current_user.share_cases.build
    @apartment = @share_case.build_apartment
    @address = @apartment.build_address
    @cities = City.all.map{ |city| [city.name, city.id] }
    @tenant_group = TenantGroup.new
    @new_image = Image.new
  end

  def create
    @share_case = current_user.share_cases.build(share_case_params)
    if @share_case.save
      @share_case.update(owner: current_user)
      respond_with(@share_case, location: user_apartment_path(@share_case.apartment))
    end 
  end

  def edit
    @apartments = current_user.apartments
  end

  def update
    @share_case.update(share_case_params)
    respond_with(@share_case, location: user_rent_cases_path)
  end

  def destroy
    @share_case.destroy
    respond_with(@share_case, location: user_rent_cases_path)
  end

  private
  def set_share_case
    @share_case = ShareCase.find(params[:id])
  end

  # def set_apartment
  #   @apartment = Apartment.find(params[:apartment_id])
  # end

  def share_case_params
    params[:share_case].permit(:price,
      apartment_attributes: [:description, image_ids: [], address_attributes: [:city_id, :district_id, :street]], 
      tenant_group_attributes: [:title, :group_size, :user_id])
  end
end
