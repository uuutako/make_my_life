class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, only: [:new]
  protect_from_forgery with: :null_session
 

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, 
      keys: [:name, :nickname , :firstname, :lastname, :first_name_kana, :last_name_kana, 
             :birthday, :sex, :age, :instagram, :facebook, :twitter, :phrase_id])
  end

end
