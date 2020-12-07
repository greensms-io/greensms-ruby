module GreenSMS
  MODULES = {
    'account' => {
      'schema' => {},
      'versions' => {
        'v1' => {
          'balance' => {
            'args' => nil,
            'method' => 'GET'
          },
          'token' => {
            'args' => ['params'],
            'method' => 'POST'
          },
          'tariff' => {
            'args' => nil,
            'method' => 'GET'
          }
        }
      }
    }
  }
end