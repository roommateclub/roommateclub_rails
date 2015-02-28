class User::TenantRentCasesController < User::BaseController
  before_action :set_tenant_rent_case, only: [:show, :edit, :update, :destroy]
  # before_action :set_apartment, except: [:index]

  respond_to :html

  def index
    @tenant_rent_cases = current_user.tenant_rent_cases.all
    respond_with(@tenant_rent_cases)
  end

  def show
    respond_with(@tenant_rent_case)
  end

  def new
    @tenant_rent_case = current_user.tenant_rent_cases.build
    @apartment = @tenant_rent_case.build_apartment
    respond_with(@tenant_rent_case)
  end

  def create
    @tenant_rent_case = current_user.tenant_rent_cases.build(tenant_rent_case_params)
    if @tenant_rent_case.save
      @tenant_rent_case.update(owner: current_user)
      respond_with(@tenant_rent_case, location: user_apartment_path(@tenant_rent_case.apartment))
    end 
  end

  def edit
    @apartments = current_user.apartments
  end

  def update
    @tenant_rent_case.update(tenant_rent_case_params)
    respond_with(@tenant_rent_case, location: user_rent_cases_path)
  end

  def destroy
    @tenant_rent_case.destroy
    respond_with(@tenant_rent_case, location: user_rent_cases_path)
  end

  private
  def set_tenant_rent_case
    @tenant_rent_case = TenantRentCase.find(params[:id])
  end

  # def set_apartment
  #   @apartment = Apartment.find(params[:apartment_id])
  # end

  def tenant_rent_case_params
    params[:tenant_rent_case].permit!
  end
end
