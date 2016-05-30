module PublicRescue
  class PublicExceptions3

    def call(env)

      exception = env["action_dispatch.exception"]
      wrapper = ActionDispatch::ExceptionWrapper.new(env, exception)

      request = ActionDispatch::Request.new(env)
      status = wrapper.status_code
      exception_details = {
              :request => request, :exception => exception,
              :status => status,
              :application_trace => wrapper.application_trace,
              :framework_trace => wrapper.framework_trace,
              :full_trace => wrapper.full_trace
      }
      request.env['public_rescue.exception_details'] = exception_details
      action = ActionDispatch::ExceptionWrapper.rescue_responses[exception.class.name]
      controller_name = Rails.configuration.public_rescue.controller.to_s.camelize << 'Controller'
      begin
        controller = Rails.const_get(controller_name)
      rescue NameError => n_E
        controller = PublicErrorsController
      end
      response = controller.action(action).call(request.env).last
      render(status, response.body)
    end

    private

    def render(status, body)
      [status, {'Content-Type' => "text/html; charset=#{ActionDispatch::Response.default_charset}", 'Content-Length' => body.bytesize.to_s}, [body]]
    end
  end
end
