$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
# require "example_helper"
require "greensms"

client = GreenSMS::GreenSMSClient.new(user: 'test', pass: 'test')

puts "Account Success"