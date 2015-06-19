class ShareCasesController < ApplicationController
  def index
    @share_cases = ShareCase.all
  end

  def show
    @share_case = ShareCase.find(params[:id])
  end
end
