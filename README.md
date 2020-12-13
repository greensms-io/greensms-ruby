# greensms-ruby

## Documentation

The documentation for the GREENSMS API can be found [here][apidocs].

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'greensms'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```
$ gem install greensms
```

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

## Methods

- You can either use username/password combination or auth token to create an object with constructor
- All methods support named keyword arguments `(to: "", extended: true)`
- Each API Function is available as `MODULE.FUNCTION()`
- Parameters for each API can be referred from [here][apidocs]
- Response keys can be used as hash keys `response['key']`
- Response keys by default are available in `snake_case`. If you want to use `camelCase`, then pass `camel_case_response: true`, in the constructor

## Handling Exceptions

- Exceptions for all APIs are thrown with `RestError` class. It extends the default Ruby StandardError class.
- Each error, will have `error`, `code`, `message`, `errorType` fields.
- In case of _Validation Error_, additional params are available to show field-wise rule failures. Can be accessed by `e.params` property on the error object

## Getting help

If you need help installing or using the library, please contact us: [support@greensms.ru](mailto:support@greensms.ru).

If you've instead found a bug in the library or would like new features added, go ahead and open issues or pull requests against this repo!

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub [here](https://github.com/greensms-ru/greensms-ruby). If you're not familiar with the GitHub pull request/contribution process, [this is a nice tutorial](https://gun.io/blog/how-to-github-fork-branch-and-pull-request/).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

[apidocs]: https://api.greensms.ru/
