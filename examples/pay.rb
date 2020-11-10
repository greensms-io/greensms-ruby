// Using 

options = { user: "user", pass: "pass", to: "3432432424232432", amount: "999" }

response = GreensmsRuby::Pay.payment(options)

response.body // this is for getting request_id


// Check Payment status

options = { user: "user", pass: "pass", id: "request_id here" }

response = GreensmsRuby::Pay.check_status(options)
