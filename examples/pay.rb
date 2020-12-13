require_relative "init"

@client = Example::CLIENT

puts "Pay Send"
resp = @client.pay.send(to: "79260000121", amount: 10)
puts resp

sleep(3)
puts "Pay Status"
puts @client.pay.status(id: resp["request_id"])
