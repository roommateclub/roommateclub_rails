class GroupsController < ApplicationController
  respond_to :html

  def index
    @groups = Group.all
  end

  def show
  end

  def new
    @rent_case = LandlordRentCase.find(params[:rent_case_id])
    @group = @rent_case.groups.build
  end

  def create
    @rent_case = LandlordRentCase.find(params[:rent_case_id])
    @group = @rent_case.groups.build
    @group.save
    respond_with(@group, location: rent_case_group_path(rent_case_id: @rent_case, id: @group))
  end

  def edit
  end

  def destroy
  end

  private

  def group_params
    params[:group].permit!
  end
end
