require 'public_rescue'

module PublicRescue
    class Engine < Rails::Engine
      
        config.public_rescue = ActiveSupport::OrderedOptions.new
        config.public_rescue.controller = :public_errors
        
        initializer "devise.add_middleware" do |app|
            app.middleware.swap ActionDispatch::ShowExceptions, Errorlogic::ShowExceptions
        end
        
        
    end
end