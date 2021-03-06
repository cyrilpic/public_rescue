module PublicRescue
  # We subclass this middleware to render nice dynamic error pages instead of classical 404.html,... files
  class ShowExceptions < ActionDispatch::ShowExceptions
    private
    # By default render_exception doesn't send the request object to rescue_action_in_public.
    # Here we just store the env variable in a class variable so we can retrieve it later.
    def render_exception(env, exception)
      @env = env
      # Original rails code is always best
      super
    end
    
    def rescue_action_in_public(exception)
      request = ActionDispatch::Request.new(@env)
      status = status_code(exception)
      exception_details = {
              :request => request, :exception => exception,
              :status => status,
              :application_trace => application_trace(exception),
              :framework_trace => framework_trace(exception),
              :full_trace => full_trace(exception)
      }
      request.env['public_rescue.exception_details'] = exception_details
      action = @@rescue_responses[exception.class.name]
      controller_name = Rails.configuration.public_rescue.controller.to_s.camelize << 'Controller'
      begin
        controller = Rails.const_get(controller_name)
      rescue NameError => n_E
        controller = PublicErrorsController
      end
      response = controller.action(action).call(request.env).last
      render(status, response.body)
        
    # Any exceptions results in calling the parent method
    rescue Exception => e
      log_error(e)
      super(exception)
    end
  end
end