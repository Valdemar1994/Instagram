class ApplicationController < ActionController::Base
  include Pundit::Authorization
  before_action :authenticate_user!
      
    before_action :configure_permitted_parameters, if: :devise_controller?

    def return_to_prev_location
      redirect_to request.referer || root_path
    end

    protected
    
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up){ |u| u.permit(:username, :name, :email, :password)}
    end
end
