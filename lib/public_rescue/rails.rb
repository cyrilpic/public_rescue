require 'public_rescue'

module PublicRescue
    class Engine < Rails::Engine
      
        config.public_rescue = ActiveSupport::OrderedOptions.new
        config.public_rescue.controller = :public_errors
        
        initializer "devise.add_middleware" do |app|
            app.middleware.swap ActionDispatch::ShowExceptions, PublicRescue::ShowExceptions, app.config.consider_all_requests_local
        end
        
        
    end
end