require 'public_rescue'

module PublicRescue
    class Engine < Rails::Engine

        config.public_rescue = ActiveSupport::OrderedOptions.new
        config.public_rescue.controller = :public_errors

        if Rails::VERSION::MAJOR >= 4
            initializer "public_rescue.set_exceptions_app" do |app|
              app.config.exceptions_app = PublicRescue::PublicExceptions.new
            end
        elsif (Rails::VERSION::MINOR == 3 && Rails::VERSION::MINOR == 2)
            initializer "public_rescue.set_exceptions_app" do |app|
                app.config.exceptions_app = PublicRescue::PublicExceptions3.new
            end
        else
            initializer "public_rescue.add_middleware" do |app|
                app.middleware.swap ActionDispatch::ShowExceptions, PublicRescue::ShowExceptions, app.config.consider_all_requests_local
            end
        end


    end
end
