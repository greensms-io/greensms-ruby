require_relative "example_helper"

client = GreenSMS::GreenSMSClient.new(user: 'test', pass: 'test', camel_case_response: true)

puts client.status