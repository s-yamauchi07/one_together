class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(resource)
    spots_path
  end

  def after_sign_in_path_for(resource)
    spots_path
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :dog_name, :dog_type_id, :dog_image])
  end
end
