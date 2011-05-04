module ActionDispatch
  # We subclass this middleware to render nice dynamic error pages instead of classical 404.html,... files
  class ShowExceptions
    private
    # By default render_exception doesn't send the request object to rescue_action_in_public.
    # Here we just store the env variable in a class variable so we can retrieve it later.
    def render_exception_with_env_hook(env, exception)
      @env = env
      # Original rails code is always best
      render_exception_without_env_hook(env,exception)
    end
    alias_method_chain :render_exception, :env_hook
    
    def rescue_action_in_public_with_dynamic(exception)
      request = Request.new(@env)
      status = status_code(exception)
      exception_details = {
              :request => request, :exception => exception,
              :status => status,
              :application_trace => application_trace(exception),
              :framework_trace => framework_trace(exception),
              :full_trace => full_trace(exception)
      }
      request.env['errorlogic.exception_details'] = exception_details
      action = @@rescue_responses[exception.class.name]
      begin
        controller = PublicErrorsController || Errorlogic::PublicErrorsController;
        response = controller.action(action).call(request.env).last
        render(status, response.body)
      # Any exceptions results in calling the parent method
      rescue Exception => e
        log_error(e)
        rescure_action_in_public_without_dynamic(excpetion)
      end
    end
    alias_method_chain :rescue_action_in_public, :dynamic
  end
end