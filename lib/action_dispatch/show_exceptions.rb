module ActionDispatch
  class ShowExceptions
    private
    def render_exception(env, exception)
      log_error(exception)

      request = Request.new(env)
      if @consider_all_requests_local || request.local?
        rescue_action_locally(request, exception)
      else
        rescue_action_in_public(request, exception)
      end
    rescue Exception => failsafe_error
      $stderr.puts "Error during failsafe response: #{failsafe_error}\n  #{failsafe_error.backtrace * "\n  "}"
      FAILSAFE_RESPONSE
    end
    
    def rescue_action_in_public(request, exception)
      status = status_code(exception)
      if status == 404
        action = @@rescue_responses[exception.class.name]
        response = Errorlogic::PublicErrorsController.action(action).call(request.env).last
        render(status, response.body)
      else
        super(exception)
      end
    end
  end
end