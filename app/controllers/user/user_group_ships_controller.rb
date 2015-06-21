class User::UserGroupShipsController < User::BaseController
  def update
    @group = UserGroupShip.find(params[:id]).groupable
    if params[:button].present?
      UserGroupShip.find(params[:id]).send(:"#{params[:button]}!")
      respond_with(@group, location: user_share_case_path(@group.share_case))
    end
  end
end
