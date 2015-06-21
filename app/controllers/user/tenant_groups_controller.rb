class User::TenantGroupsController < User::BaseController

  def index
    @tenant_groups = current_user.tenant_groups
  end

  def show
    @group = current_user.tenant_group
    @pending_list = @group.user_group_ships.where(state: "pending")
    @approved_list = @group.user_group_ships.where(state: "approved")
  end

  def ask_to_join_group
    @group = TenantGroup.find(params[:id])
    @share_case = @group.share_case
    @user_group_ship = @group.user_group_ships.build(user_group_ship_params)
    if @user_group_ship.save
      @user_group_ship.update(user: current_user)
      binding.remote_pry
      flash[:notice] = "success!"
      redirect_to share_case_path(@share_case)
    else
      flash[:alert] = "failed"
      redirect_to share_case_path(@share_case)
    end
  end

  private

  # def tenant_group_params
  #   params[:]
  # end

  def user_group_ship_params
    params[:user_group_ship].permit(:message)
  end
end
