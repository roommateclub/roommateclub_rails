class User::ProfilesController < User::BaseController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def show
    respond_with(@profile)
  end

  def new
    @profile = Profile.new
    respond_with(@profile)
  end

  def edit
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.save
    respond_with(@profile)
  end

  def update
    @profile.update(profile_params)
    respond_with(@profile, location: user_profile_path)
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
    params.require(:profile).permit(:nickname, :gender, :birthdate, :user_id)
  end
end
