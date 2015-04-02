class User::GroupsController < User::BaseController
  before_action :set_group, except:[:index]
  def index
    @groups = Group.where(organizer: current_user)
  end

  def show
    @user_group_ships = @group.user_group_ships
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
