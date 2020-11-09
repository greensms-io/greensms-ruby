module GreensmsRuby
  class Error < StandardError; end
  # Your code goes here...
  class Additional
    def self.number_info(options = {})
      to = options[:to]
    	uri = URI.parse("https://api3.greensms.ru/whois/lookup?to=#{to}")
      response = Net::HTTP.get_response(uri)
      response.code
      response.body
    end

    # user, pass, request_id/message_id
    def self.server_status(options = {})
      uri = URI.parse("https://api3.greensms.ru/status")
      response = Net::HTTP.get_response(uri)
      response.code
      response.body
    end
  end
end
