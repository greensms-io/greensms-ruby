require_relative "init"

@client = Example::CLIENT

puts "HLR Send"
resp = @client.hlr.send(to: "79260000121", txt: "1221")
puts resp

sleep(3)
puts "HLR Status"
puts @client.hlr.status(id: resp["request_id"], to: "79260000121")
