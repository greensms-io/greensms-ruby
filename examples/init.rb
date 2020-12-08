$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "greensms"

module Example
  CLIENT = GreenSMS::GreenSMSClient.new(user: "test", pass: "test")
end
