require_relative "init"

@client = Example::CLIENT

puts "Fetch Token"
token_resp = @client.account.token(token: 100)
token = token_resp["access_token"]

puts "Run with Token"
@token_client = GreenSMS::GreenSMSClient.new(token: token)
puts @token_client.status
