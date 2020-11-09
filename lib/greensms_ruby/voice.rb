module GreensmsRuby
  class Error < StandardError; end
  # Your code goes here...
  class Voice
    def self.send_message(options = {})
		uri = URI.parse("https://api3.greensms.ru/voice/send")
		request = Net::HTTP::Post.new(uri)
		lang = options[:lang].present? ? options[:lang] : "ru"
		request.set_form_data(
		  "lang" => lang,
		  "pass" => options[:pass],
          "to" => options[:to],
          "txt" => options[:text],
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
		uri = URI.parse("https://api3.greensms.ru/voice/status?user=#{user}&pass=#{pass}&id=#{id}")
		response = Net::HTTP.get_response(uri)
		response.code
		response.body
    end
  end
end
