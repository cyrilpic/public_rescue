require 'errorlogic'

module Errorlogic
    class Engine < Rails::Engine
      
        config.errorlogic = ActiveSupport::OrderedOptions.new
        config.errorlogic.controller = :public_errors
        
        initializer "devise.add_middleware" do |app|
            app.middleware.swap ActionDispatch::ShowExceptions, Errorlogic::ShowExceptions
        end
        
        
    end
end