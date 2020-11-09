
module GreensmsRuby
  class Error < StandardError; end
  # Your code goes here...
  class Pay
    def self.payment(options = {})
		puts "Starting"
		uri = URI.parse("https://api3.greensms.ru/pay/send")
		request = Net::HTTP::Post.new(uri)
		request.set_form_data(
		  "amount" => options[:amount],
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
		uri = URI.parse("https://api3.greensms.ru/pay/status?user=#{user}&pass=#{pass}&id=#{id}")
		response = Net::HTTP.get_response(uri)
		response.code
		response.body
    end
  end
end
