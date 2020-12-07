require "greensms/utils/validator"


module GreenSMS
  module API
    class Module
      def initialize(rest_client, module_schema, kwargs):
        @rest_client = rest_client
        @module_schema = module_schema
        @params = {}
        kwargs.each { |name, value| @params[name] = value) }
      end


      def api_func(kwargs)
        if !@module_schema.nil? then
          errors = GreenSMS.validate(@module_schema, kwargs)
          if !errors.nil? then
            return errors
        end

        api_params = {}
        kwargs.each { |name, value| api_params[name] = value) }
        request_params = @params.clone
        request_params['params'] = api_params

        response = @rest_client.request(request_params)
        return response
      end
    end
  end
end