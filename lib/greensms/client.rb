require "greensms/version"
require "greensms/utils/str"

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

      # shared_options = { => @use_token_for_requests,  => get_version(version),  => _http_client(use_camel_case: camel_case_response),  => base_url()}
      # add_modules(shared_options)
      puts "Init GreenSMS"
    end
  end

end
