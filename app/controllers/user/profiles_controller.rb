class User::ProfilesController < User::BaseController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def show
    respond_with(@profile)
  end

  def new
    @profile = current_user.build_profile
    respond_with(@profile)
  end

  def edit
  end

  def create
    @profile = current_user.build_profile(profile_params)
    @profile.save
    respond_with(@profile, location: user_dashboard_path)
    # flash[:notice] "歡迎"
  end

  def update
    @profile.update(profile_params)
    respond_with(@profile, location: user_dashboard_path)
    # flash[:notice] "修改成功"
  end

  def destroy
    @profile.destroy
    respond_with(@profile)
  end

  private
  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:nickname, :gender, :birthdate)
  end
end
