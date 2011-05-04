class <%= class_name %>Controller < PublicRescue::PublicErrorsController
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