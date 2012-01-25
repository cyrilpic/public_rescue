require 'public_rescue'

module PublicRescue
    class Engine < Rails::Engine
      
        config.public_rescue = ActiveSupport::OrderedOptions.new
        config.public_rescue.controller = :public_errors
        
        if Rails::VERSION::MINOR == 2
          config.exceptions_app = PublicRescue::PublicExceptions
        else
          initializer "public_rescue.add_middleware" do |app|
              app.middleware.swap ActionDispatch::ShowExceptions, PublicRescue::ShowExceptions, app.config.consider_all_requests_local
          end
        end
        
        
    end
end