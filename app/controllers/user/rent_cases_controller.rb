class User::RentCasesController < User::BaseController
  before_action :set_rent_case, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @rent_cases = current_user.rent_cases.all
    respond_with(@rent_cases)
  end

  def show
    respond_with(@rent_case)
  end

  def new
    @rent_case = RentCase.new
    respond_with(@rent_case)
  end

  def create
    @rent_case = current_user.rent_cases.build(rent_case_params)
    @rent_case.save
    respond_with(@rent_case, location: user_rent_case_path(@rent_case))
  end

  def edit
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

  def rent_case_params
    params[:rent_case].permit!
  end
end
