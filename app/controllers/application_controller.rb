class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  	def after_sign_in_path_for(resource)
      case resource
      when Admin
        admins_root_path
      when Member
        products_path
      
     end

  	end
  	


	 def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :address, :tel])
    end
end
