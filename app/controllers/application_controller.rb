class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :account_update do |user_params|
      user_params.permit :email, :password, :password_confirmation,
        :current_password, profile_attributes: [:name,
        :age, :address, :phone_number, :job, :avatar]
    end
    devise_parameter_sanitizer.permit :sign_up do |user_params|
      user_params.permit :email, :password, :password_confirmation,
        profile_attributes: [:name, :age,
        :address, :phone_number, :job, :avatar]
    end
  end
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url
  end
end
