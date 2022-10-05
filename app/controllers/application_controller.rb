class ApplicationController < ActionController::Base
  
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(
      :first_name,
      :last_name,
      :email,
      :password
      )
    }
  end

  private

  def not_found
    render file: 'public/404.html', status: :not_found, layout: false
  end

end