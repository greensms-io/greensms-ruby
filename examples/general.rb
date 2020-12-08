$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
# require "example_helper"
require "greensms"

client = GreenSMS::GreenSMSClient.new(user: 'test', pass: 'test', camel_case_response: true)

puts client.status