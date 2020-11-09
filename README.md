# GreensmsRuby

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/greensms_ruby`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'greensms_ruby'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install greensms_ruby

## Usage

Check out these [code examples](examples) in JavaScript and TypeScript to get up and running quickly.

```ruby
// Send GreenSms with user and pass

options = { user:"valid_greensms_username", pass: "password", from:"optional", to: "98765432101", txt: "Message text here" }

response = GreensmsRuby::Sms.send_message(options)
response.body // get response_id from here
response.code // get response code from here 


```

### Environment Variables

`greensms_ruby` supports credential storage in environment variables. If no credentials are provided following env vars will be used: `GREENSMS_USER`/`GREENSMS_PASS` OR `GREENSMS_TOKEN`.

### Token Auth

```ruby

options = { token: "Authentication token here", from:"optional", to: "98765432101", txt: "Message text here" }

response = GreensmsRuby::Sms.send_message(options)
response.body // get response_id from here
response.code // get response code from here 
```

### Callback Example

```ruby

// Get response_id first

options = { user:"valid_greensms_username", pass: "password", from:"optional", to: "98765432101", txt: "Message text here" }

response = GreensmsRuby::Sms.send_message(options)
response.body // get response_id from here
response.code // get response code from here 


// Check Sms Status
options =  { user:"valid_greensms_username", pass: "password", id: "response_id here" }

response = GreensmsRuby::Sms.check_status(options)
```

## Methods

- You can either use username/password combination or auth token to create an object with constructor
- Parameters for each API can be referred from [here][apidocs]

## Getting help

If you need help installing or using the library, please contact us: [support@greensms.ru](mailto:support@greensms.ru).

If you've instead found a bug in the gem or would like new features added, go ahead and open issues or pull requests against this repo!

## Contributing

Bug fixes, docs, and library improvements are always welcome. Please refer to our [Contributing Guide](CONTRIBUTING.md) for detailed information on how you can contribute.
If you're not familiar with the GitHub pull request/contribution process, [this is a nice tutorial](https://gun.io/blog/how-to-github-fork-branch-and-pull-request/).

### Getting Started

If you want to familiarize yourself with the project, you can start by [forking the repository](https://help.github.com/articles/fork-a-repo/) and [cloning it in your local development environment](https://help.github.com/articles/cloning-a-repository/). The project requires [Ruby](https://rubygems.org/) to be installed on your machine.

After cloning the repository, install the dependencies by running the following command in the directory of your cloned repository:

```bash
gem install greensms_ruby

bundle install
``

[apidocs]: https://api.greensms.ru/
