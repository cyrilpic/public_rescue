#Errorlogic.rb
require 'rails'
require 'active_support/dependencies/autoload'
require 'action_dispatch'

module Errorlogic
  extend ActiveSupport::Autoload
  autoload :ShowExceptions
  autoload :PublicErrorsController
end

require 'errorlogic/rails'