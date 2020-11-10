// Using 

options = { user:"user", pass: "pass", to: "98765432101" }

response = GreensmsRuby::Call.send_verification(options)

response.body // this is for getting request_id


// Check status 

options = { user: "user", pass: "pass", id: "request_id here", to: "9887377382822" }

response = GreensmsRuby::Call.check_status(options)
