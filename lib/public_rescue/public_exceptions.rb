module PublicRescue
  class PublicExceptions < ActionDispatch::PublicExceptions

    def initialize
    end

    def call(env)
      @env = env
      super(env)
    end

    private

    def render_html(status)
      exception = @env["action_dispatch.exception"]
      wrapper = ActionDispatch::ExceptionWrapper.new(@env, exception)

      request = ActionDispatch::Request.new(@env)

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
      render_format(status, 'text/html', response.body)
    end

  end
end
