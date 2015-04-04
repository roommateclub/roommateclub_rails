class User::BaseController < ApplicationController
  before_action :is_user
  layout 'user_dashboard'
  def index
    
  end
end
