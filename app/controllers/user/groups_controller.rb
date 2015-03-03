class User::GroupsController < User::BaseController
  before_action :set_group
  def index
    @groups = current_user.groups.includes(:users)
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end
end
