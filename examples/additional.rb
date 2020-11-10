// Using 

options = { to: "98765432101" }

response = GreensmsRuby::Additional.number_info(options)

response.body // this is for getting request_id


// Check server status 

response = GreensmsRuby::Additional.server_status
