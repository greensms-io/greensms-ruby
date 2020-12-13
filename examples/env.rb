require_relative "init"

puts "Set Env Variables"
ENV["GREENSMS_USER"] = "test"
ENV["GREENSMS_PASS"] = "test"

puts "\nExecute Client Example"
@env_client = GreenSMS::GreenSMSClient.new
puts @env_client.account.balance

puts "\nDelete Env Variables"
ENV.delete("GREENSMS_USER")
ENV.delete("GREENSMS_PASS")
