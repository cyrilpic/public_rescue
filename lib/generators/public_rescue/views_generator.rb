module PublicRescue
  module Generators
    class ViewsGenerator < Rails::Generators::Base
      source_root File.expand_path("../../../../app/views", __FILE__)
      desc "Copies all PublicRescue views to your application."

      argument :scope, :required => false, :default => nil,
                       :desc => "The scope to copy views to"
      def copy_views
        directory "public_rescue", "app/views/#{scope || :public_rescue}"
      end
    end
  end
end
