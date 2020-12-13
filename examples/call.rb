require_relative "init"

@client = Example::CLIENT

puts "Call Send"
resp = @client.call.send(to: "79260000112")
puts resp

sleep(3)
puts "Call Status"
puts @client.call.status(id:resp['request_id'])