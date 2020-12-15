def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, :image, address_attributes: [:address_1, :address_2, :city, :state, :country, :postal_code]])
     devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :phone, :image, :password, :password_confirmation, :current_password)}
   end
liek this you can permit the address attributes under user
and in form you can use 
f.fields_for :address do |add|
check the sysntex