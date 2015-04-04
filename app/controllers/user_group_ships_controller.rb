class UserGroupShipsController < ApplicationController

  before_action :is_user
  respond_to :html

  def create
    @group = Group.find(params[:id])
    @user_group_ship = @group.user_group_ships.build(user_group_ship_params)
    @user_group_ship.user = current_user
    @user_group_ship.save
    respond_with(@group)
  end

  private

  def user_group_ship_params
    params[:user_group_ship].permit(:message)
  end
end
