class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?

	  protected

	  def configure_permitted_parameters
	    added_attrs = [ :email, :password, :password_confirmation, :name, :age, :photo, :height, :gender, :phone, :shop_id, :hp_url, :facebook_url, :twitta_url, :instaguram_url ]
	    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
	    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
	    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
	  end
end
