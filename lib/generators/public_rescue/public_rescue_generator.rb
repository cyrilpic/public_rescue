module PublicRescue
  module Generators
    class PublicRescueGenerator < Rails::Generators::Base
      namespace 'public_rescue'
      source_root File.expand_path("../../../../", __FILE__)
      
      desc "Creates a controller that inherits from PublicRescue::PublicErrorsController."

      def create_controller_files
        template 'lib/generators/template/controller.rb', File.join('app/controllers', class_path, "#{file_name}_controller.rb")
        directory "app/views/public_rescue/public_errors", File.join('app/views', class_path, "#{file_name}")
      end
      
      hook_for :test_framework, :as => :controller
    end
  end
end
