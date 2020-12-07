require "greensms/version"
require "greensms/utils/str"
require "greensms/utils/url"
require "greensms/utils/version"
require "greensms/http/rest"

module GreenSMS
  class Error < StandardError; end

  class GreenSMSClient
    def initialize(user: nil, pass: nil, token: nil, version: nil, camel_case_response: false, use_token_for_requests: false)
      @user = ENV.fetch('GREENSMS_USER', user)
      @pass = ENV.fetch('GREENSMS_PASS', pass)
      @token = ENV.fetch('GREENSMS_TOKEN', token)

      @version = version
      @camel_case_response = camel_case_response
      @use_token_for_requests = use_token_for_requests

      if !GreenSMS.is_null_or_empty(@token)
        @user = ''
        @password = ''
      end

      if GreenSMS.is_null_or_empty(@token) and (GreenSMS.is_null_or_empty(@user) || GreenSMS.is_null_or_empty(@pass))
        raise StandardError.new "Either User/Pass or Auth Token is required!"
      end

      shared_options = {
        'use_token_for_requests' => @use_token_for_requests,
        'version' => GreenSMS.get_version(@version),
        'rest_client' => _get_http_client(use_camel_case: @camel_case_response),
        'base_url' => GreenSMS.base_url()
      }

      _add_modules(shared_options)
      puts "Init GreenSMS"
    end

    private
    def _add_modules(shared_options)
      url = GreenSMS.base_url() + "/account/balance"
      rest_client = shared_options['rest_client'].request(method: 'GET', url: url)
    end

    def _get_http_client(**kwargs)
      puts "HTTP Clients"
      default_params = {}

      if GreenSMS.is_null_or_empty(@token) && !GreenSMS.is_null_or_empty(@user) then
        default_params['user'] = @user
        default_params['pass'] = @pass
      end

      http_args = {
        'default_params': default_params,
        'default_data': {},
        'token': @token
      }

      kwargs.each do |key, val|
        http_args[key] = val
      end

      rest_client = GreenSMS::Http::Client.new(http_args)
      return rest_client
    end


  end

end
