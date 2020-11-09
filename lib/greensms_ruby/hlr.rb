module GreensmsRuby
  class Error < StandardError; end
  # Your code goes here...
  class Hlr
    def self.send_message(options = {})
    	puts "Starting"
      uri = URI.parse("https://api3.greensms.ru/hlr/send")
      request = Net::HTTP::Post.new(uri)
      request.set_form_data(
        "pass" => options[:pass],
        "to" => options[:to],
        "user" => options[:user],
      )
      req_options = {
        use_ssl: uri.scheme == "https",
      }
      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end
      response.code
      response.body
    end

    # user, pass, request_id/message_id
    def self.check_status(options = {})
      user = options[:user]
      pass = options[:pass]
      id = options[:request_id]
      to = options[:to]
      uri = URI.parse("https://api3.greensms.ru/hlr/status?user=#{user}&pass=#{pass}&to=#{to}&id=#{id}")
      response = Net::HTTP.get_response(uri)
      response.code
      response.body
    end
  end
end
