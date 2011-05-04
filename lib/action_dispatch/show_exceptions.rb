module ActionDispatch
  # We subclass this middleware to render nice dynamic error pages instead of classical 404.html,... files
  class ShowExceptions
    private
    # By default render_exception doesn't send the request object to rescue_action_in_public.
    # Here we just store the env variable in a class variable so we can retrieve it later.
    def render_exception(env, exception)
      @env = env
      # Original rails code is always best
      super(env,exception)
    end
    
    
    def rescue_action_in_public(exception)
      request = Request.new(@env)
      status = status_code(exception)
      action = @@rescue_responses[exception.class.name]
      controller = PublicErrorsController || Errorlogic::PublicErrorsController;
      response = controller.action(action).call(request.env).last
      render(status, response.body)
      end
    # Any exceptions results in calling the parent method
    rescue Exception => e
      log_error(e)
      super(excpetion)
    end
    
  end
end