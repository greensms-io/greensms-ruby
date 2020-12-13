require_relative "init"

@client = Example::CLIENT

puts "Viber Send"
resp = @client.viber.send(to: "79260000121", txt: "Hello Message Content")
puts resp

sleep(3)
puts "Viber Status"
puts @client.viber.status(id: resp["request_id"])
