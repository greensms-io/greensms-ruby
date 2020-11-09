// Using 

options = { user:"user", pass: "pass", from: "optional", to: "98765432101", txt: "This is an example message" }

response = GreensmsRuby::Sms.send_message(options)

response.body // this is for getting request_id


Check status 

uri = URI.parse("https://api3.greensms.ru/sms/status?user=#{user}&pass=#{pass}&id=#{id}")

response = Net::HTTP.get_response(uri)