class User::TenantGroupsController < User::BaseController
  def show
    @group = current_user.tenant_group
    @pending_list = @group.user_group_ships.where(state: "pending")
    @approved_list = @group.user_group_ships.where(state: "approved")
  end
end
