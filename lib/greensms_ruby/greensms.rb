module GreensmsRuby
  class Error < StandardError; end
  # Your code goes here...
  class Sms
    def self.send_message(options = {})
    	puts "Starting"
      uri = URI.parse("https://api3.greensms.ru/sms/send")
      request = Net::HTTP::Post.new(uri)
      from = options[:from] != "" ? options[:from] : "GREENSMS"
      if options[:token]
        request.set_form_data(
          "from" => from,
          "token" => options[:token],
          "to" => options[:to],
          "txt" => options[:text],
        )
      else
        request.set_form_data(
          "from" => from,
          "pass" => options[:pass],
          "to" => options[:to],
          "txt" => options[:text],
          "user" => options[:user],
        )
      end
      req_options = {
        use_ssl: uri.scheme == "https",
      }

      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end
      return response
      puts response.code
      puts response.body
    end

    # user, pass, request_id/message_id
    def self.check_status(options = {})
      user = options[:user]
      pass = options[:pass]
      id = options[:request_id]
      uri = URI.parse("https://api3.greensms.ru/sms/status?user=#{user}&pass=#{pass}&id=#{id}")
      response = Net::HTTP.get_response(uri)
      return response
      response.code
      response.body
    end
  end
end
