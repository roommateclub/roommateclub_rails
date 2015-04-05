class User::UserGroupShipsController < User::BaseController
  def update
    @group = UserGroupShip.find(params[:id]).group
    if params[:button].present?
      UserGroupShip.find(params[:id]).send(:"#{params[:button]}!")
      respond_with(@group, location: user_group_path(@group))
    end
  end
end
