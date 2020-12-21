class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
   #devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password,:mobile, addresses_attributes: [:address_1, :address_2, :city, :state, :country, :postal_code] )}
   devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :mobile, :image, address_attributes: [:address_1, :address_2, :city, :state, :country, :postal_code]])
   devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :mobile)}
  end

end
