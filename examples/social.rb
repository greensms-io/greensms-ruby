require_relative "init"

@client = Example::CLIENT

puts "Social Send"
resp = @client.social.send(to: "79260000121", txt: "Hello Message Content", from: "GreenSMS")
puts resp

sleep(3)
puts "Social Status"
puts @client.social.status(id: resp["request_id"])
