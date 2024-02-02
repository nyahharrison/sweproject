class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :set_active_storage_url_options
  
    def after_sign_in_path_for(resource)
      root_path # or any other path you want to redirect to
    end
  
    def after_sign_out_path_for(resource_or_scope)
      root_path
    end
  
    private
  
    def set_active_storage_url_options
      ActiveStorage::Current.url_options = {
        host: request.base_url,
        protocol: request.protocol
      }
    end
  end
  