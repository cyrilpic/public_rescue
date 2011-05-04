class Errorlogic::PublicErrorsController < ApplicationController
  # This is just a very basic controller
  # For custom methods just create our own PublicErrorsController which subclasses this one
  
  # env['errorlogic.exception_details'] variable contains additional information on the exception
  # {
  #  :request,
  #  :exception,
  #  :status,
  #  :application_trace,
  #  :framework_trace,
  #  :full_trace
  # }
  
  # 404
  def not_found
  end
  
  # 500
  def internal_server_error
  end
  
  def conflict
    render :action => :internal_server_error
  end
  
  def not_implemented
    render :action => :internal_server_error
  end
  
  def method_not_allowed
    render :action => :internal_server_error
  end
  
  # 422
  def unprocessable_entity
  end
end
