module Errorlogic
  module Generators
    class ViewsGenerator < Rails::Generators::Base
      source_root File.expand_path("../../../app/views", __FILE__)
      desc "Copies all Errorlogic views to your application."

      argument :scope, :required => false, :default => nil,
                       :desc => "The scope to copy views to"
      def copy_views
        directory "errorlogic", "app/views/#{scope || :errorlogic}"
      end
    end
  end
end
