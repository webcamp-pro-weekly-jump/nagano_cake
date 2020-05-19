class ApplicationController < ActionController::Base
  	def after_sign_in_path_for(resource)
      if member_signed_in?
    	root_path(resource)
      else 
        admin_signed_in?
        admins_root_path(resource)

      end
  	end
  	def after_sign_out_path_for(resource)
      if member_signed_in?
  		   root_path(resource)
      else
        admin_signed_in?
        new_admin_session_path
      end
     
  	  
    end


	before_action :configure_permitted_parameters, if: :devise_controller?

	 def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :fist_name, :family_name_kana, :first_name_kana, :postal_code, :address, :tel])
    end
end
