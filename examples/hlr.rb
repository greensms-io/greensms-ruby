// Using 

options = { user:"user", pass: "pass", from: "optional", to: "98765432101", txt: "This is an example message" }

response = GreensmsRuby::Hlr.send_message(options)

response.body // this is for getting request_id

// Check status 

options = { user:"user", pass: "pass", id: "request_id here", to: "45345435345435" }

response = GreensmsRuby::Hlr.check_status(options)