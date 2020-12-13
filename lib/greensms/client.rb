require "greensms/version"
require "greensms/utils/str"
require "greensms/utils/url"
require "greensms/utils/version"
require "greensms/http/rest"
require "greensms/api/module_loader"

module GreenSMS
  class Error < StandardError; end

  class MethodInvoker
  end

  class GreenSMSClient

    attr_reader :call
    attr_reader :voice

    def initialize(user: nil, pass: nil, token: nil, version: nil, camel_case_response: false, use_token_for_requests: false)
      @user = ENV.fetch("GREENSMS_USER", user)
      @pass = ENV.fetch("GREENSMS_PASS", pass)
      @token = ENV.fetch("GREENSMS_TOKEN", token)

      @version = version
      @camel_case_response = camel_case_response
      @use_token_for_requests = use_token_for_requests

      if !GreenSMS.is_null_or_empty(@token)
        @user = ""
        @password = ""
      end

      if GreenSMS.is_null_or_empty(@token) and (GreenSMS.is_null_or_empty(@user) || GreenSMS.is_null_or_empty(@pass))
        raise StandardError.new "Either User/Pass or Auth Token is required!"
      end

      shared_options = {
        "use_token_for_requests" => @use_token_for_requests,
        "version" => GreenSMS.get_version(@version),
        "rest_client" => _get_http_client(use_camel_case: @camel_case_response),
        "base_url" => GreenSMS.base_url(),
      }

      _add_modules(shared_options)
    end

    private

    def _add_modules(shared_options)
      module_loader = GreenSMS::API::ModuleLoader.new
      modules = module_loader.register_modules(shared_options)
      build_module_invoker(self, modules, "root")
    end

    def build_module_invoker(obj, hash, obj_name)
      hash.each do | key_name, key_value |
        if key_value.is_a?(Hash)
          new_item = MethodInvoker.new
          build_module_invoker(new_item, key_value, key_name)
          obj.instance_variable_set("@#{key_name}", new_item)
          obj.instance_eval %{
            def #{key_name}
              instance_variable_get("@#{key_name}")
            end
          }
        else
          func = key_value.clone
          obj.instance_variable_set("@#{key_name}", func.method(:api_func))

          obj.instance_eval %{
            def #{key_name}(*args)
              instance_variable_get("@#{key_name}").call(args)
            end
          }
        end
      end
    end

    def _get_http_client(**kwargs)
      default_params = {}

      if GreenSMS.is_null_or_empty(@token) && !GreenSMS.is_null_or_empty(@user)
        default_params["user"] = @user
        default_params["pass"] = @pass
      end

      http_args = {
        'default_params': default_params,
        'default_data': {},
        'token': @token,
      }

      kwargs.each do |key, val|
        http_args[key] = val
      end

      rest_client = GreenSMS::Http::Client.new(http_args)
      return rest_client
    end
  end
end