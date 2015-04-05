class User::BaseController < ApplicationController
  before_action :is_user
  respond_to :html
  layout 'user_dashboard'
  def index
    
  end
end
