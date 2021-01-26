class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception


   #Redirect with locale after authentication failure 
   def set_locale
      I18n.locale = params[:locale]
    end

    def self.default_url_options(options={})
      options.merge({ :locale => I18n.locale })
    end 
# Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end


end
