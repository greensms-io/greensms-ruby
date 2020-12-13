$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "greensms"

require "minitest/autorun"

module Utility
  CLIENT = GreenSMS::GreenSMSClient.new(user: "test", pass: "test")

  class << self
    def random_phone_number(min = 70000000111, max = 70009999999)
      return random_number(min, max)
    end

    def random_number(min, max)
      return rand(min..max).to_s
    end

    def instance_with_env()
      ENV["GREENSMS_USER"] = "test"
      ENV["GREENSMS_PASS"] = "test"
      @env_client = GreenSMS::GreenSMSClient.new
      ENV.delete("GREENSMS_USER")
      ENV.delete("GREENSMS_PASS")
      return @env_client
    end
  end
end
