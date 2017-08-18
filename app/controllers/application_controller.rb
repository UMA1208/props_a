class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :family_name_kana, :first_name, :first_name_kana, :icon_image, :header])
  end
end
