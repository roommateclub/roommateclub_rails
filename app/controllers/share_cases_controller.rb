class ShareCasesController < ApplicationController
  def index
    @share_cases = ShareCase.all
  end

  def show
    @share_case = ShareCase.find(params[:id])
    @tenant_group = @share_case.tenant_group
    @user_group_ship = @tenant_group.user_group_ships.build
  end
end
