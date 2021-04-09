class ApplicationController < ActionController::Base


  # ログイン後のリダイレクト先を変更
  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end


end
