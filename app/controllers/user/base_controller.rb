class User::BaseController < ApplicationController
  before_action :is_user
  def dashboard
  end

  def is_user
    unless current_user.present?
      redirect_to new_user_registration_path
      # flash alert "必須登入"
    end
  end
end
