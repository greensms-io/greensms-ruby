require_relative "init"

@client = Example::CLIENT

puts "Voice Send"
resp = @client.voice.send(to: "79260000121", txt: "8601")
puts resp

sleep(3)
puts "Voice Status"
puts @client.voice.status(id: resp["request_id"])
