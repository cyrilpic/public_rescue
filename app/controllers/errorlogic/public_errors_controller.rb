class Errorlogic::PublicErrorsController < ApplicationController
  # This is just a very basic controller
  # For custom methods just create our own PublicErrorsController which subclasses this one
  
  
  
  # 404 error
  def not_found
  end
  
  def conflict
  end
  
  def not_implemented
  end
  
  def method_not_allowed
  end
  
  def unprocessable_entity
  end
end
