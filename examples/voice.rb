// Using 

options = { user:"user", pass: "pass", to: "98765432101", txt: "This is an example message", lang: "eng" }

response = GreensmsRuby::Voice.send_message(options)

response.body // this is for getting request_id


// Check status 

options = { user:"user", pass: "pass", id: "request_id here" }

response = GreensmsRuby::Voice.check_status(options)
