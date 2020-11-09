module GreensmsRuby
  class Error < StandardError; end
  # Your code goes here...
  class Account
    def self.balance_check(options = {})
      user = options[:user]
      pass = options[:pass]
      uri = URI.parse("http://api3.greensms.ru/account/balance?user=#{user}&pass=#{pass}")
      response = Net::HTTP.get_response(uri)
      response.code
      response.body
    end

    # user, pass, request_id/message_id
    def self.get_access_token(options = {})
      user = options[:user]
      pass = options[:pass]
      uri = URI.parse("http://api3.greensms.ru/account/token?user=#{user}&pass=#{pass}")
      response = Net::HTTP.get_response(uri)
      response.code
      response.body
    end

    def self.tariff_details
      user = options[:user]
      pass = options[:pass]
      uri = URI.parse("http://api3.greensms.ru/account/tariff?user=#{user}&pass=#{pass}")
      response = Net::HTTP.get_response(uri)
      response.code
      response.body
    end
  end
end
