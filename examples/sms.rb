require_relative "init"

@client = Example::CLIENT

puts "SMS Send"
resp = @client.sms.send(to: "79260000121", txt: "Hello Message Content")
puts resp

sleep(3)
puts "SMS Status"
puts @client.sms.status(id: resp["request_id"])
