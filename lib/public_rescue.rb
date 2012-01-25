#PublicRecscue.rb
require 'rails'
require 'active_support/dependencies/autoload'
require 'action_dispatch'

module PublicRescue
  extend ActiveSupport::Autoload
  autoload :ShowExceptions
  autoload :PublicErrorsController
  autoload :PublicExceptions
end

require 'public_rescue/rails'