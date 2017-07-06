class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_user_parameters, if: :devise_controller?
  protected

  #set up whitelist for devise. this is for the "signup" form and the "update your account" form. this allows the user to only send through certain info via the form. (Devise built the form)
  def configure_permitted_user_parameters
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit({roles:[]}, :email, :password, :password_confirmation, :name, :username, :bio, :location)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :name, :username, :bio, :location)}


  end
end
