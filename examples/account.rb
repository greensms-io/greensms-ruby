// Using 

options = { user:"user", pass: "pass" }

response = GreensmsRuby::Account.balance_check(options)

response.body // this is for getting request_id


// Check tariff details 

options = { user:"user", pass: "pass" }

response = GreensmsRuby::Account.tariff_details(options)

// Fetch access token 

options = { user:"user", pass: "pass" }

response = GreensmsRuby::Account.get_access_token(options)
