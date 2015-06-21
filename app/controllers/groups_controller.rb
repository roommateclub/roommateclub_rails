class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :join_group]
  before_action :is_user, except: [:index]
  respond_to :html

  def index
    @groups = Group.all.includes(:rent_cases)
  end

  def show
    @user_group_ship = @group.user_group_ships.find_by(user: current_user)
    @group.user_group_ships.find_by(user: current_user)
    @new_user_group_ship = @group.user_group_ships.build if current_user.can_join?(@group)
  end

  def new
    if current_user.can_create_group?
      @group = current_user.groups.build
    else
      redirect_to :back, alert: "你不能發起合租"
    end
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      @group.update(organizer: current_user)
      @group.user_group_ships.create(user: current_user, state: "approved")
      respond_with(@group)
    else
      render :show, alert: "Fuck"
    end
  end

  def edit
  end

  def destroy
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params[:group].permit!
  end
end
