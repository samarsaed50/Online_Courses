class ApplicationController < ActionController::Base
    rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
    end
   # check_authorization
    protect_from_forgery with: :exception
 
    before_action :configure_permitted_parameters, if: :devise_controller?
 
    protected
 
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation, :gender, :date_of_birth, :remember_me, :profilepc, :profilepc_cache) }
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation, :current_password, :gender, :date_of_birth, :profilepc, :profilepc_cache, :remove_profilepc) }
    end  
end
