# greensms-ruby

## Documentation

The documentation for the GREENSMS API can be found [here][apidocs].

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'greensms'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install greensms

## Sample Usage

Check out these [code examples](examples) to get up and running quickly.

```ruby

require "greensms"

# Register at my.greeensms.ru first
@client = GreenSMS::GreenSMSClient.new(user: "test", pass: "test")

response = @client.sms.send(to: '71231234567', txt: 'Message to deliver')
puts response["request_id"]


```

### Environment Variables

`greensms-ruby` supports credential storage in environment variables. If no credentials are provided following env vars will be used: `GREENSMS_USER`/`GREENSMS_PASS` OR `GREENSMS_TOKEN`

### Token Auth

```ruby

require "greensms"

# Register at my.greeensms.ru first
@client = GreenSMS::GreenSMSClient.new(token: "Your Auth Token comes here")

response = @client.account.balance
puts response["balance"]


```

## Compatibility

`greensms-ruby` is compatible with Ruby 2.4+ onwards until the latest version

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/greensms. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/greensms/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Greensms project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/greensms/blob/master/CODE_OF_CONDUCT.md).
