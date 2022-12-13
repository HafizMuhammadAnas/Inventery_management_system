class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
	before_action :authenticate_user!
	before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :address, :name, :role, :password, :password_confirmation, :current_password, :contect_number ,:branch_name,:account_update,  :update_attrs, :image])
		devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password,:password_confirmation, :current_password, :image)}
  end

	rescue_from CanCan::AccessDenied do |exception|
		respond_to do |format|
			format.json { head :forbidden, content_type: 'text/html' }
			format.html {
				redirect_to main_app.root_url
				flash[:error] = exception.message
			}
			format.js   { head :forbidden, content_type: 'text/html' }
		end
	end


end
