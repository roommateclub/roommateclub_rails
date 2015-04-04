class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def is_user
    unless current_user.present?
      redirect_to new_user_registration_path
      # flash alert "必須登入"
    end
  end
end
