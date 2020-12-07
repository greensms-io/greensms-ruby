require "faraday"
require "greensms/utils/str"
require "json"


module GreenSMS
  module Http
    class Client
      def initialize(opts)
        @token = nil
        @default_data = {}
        @default_params = {}

        opts.each { |name, value| instance_variable_set("@#{name}", value) }
      end


      def request(**kwargs)

        if ! kwargs.has_key? :method then
          raise StandardError.new "Http Method is required"
        end
        method = kwargs[:method]

        if ! kwargs.has_key? :url then
          raise StandardError.new "URL is required"
        end
        url = kwargs[:url]

        kwargs.delete('url')
        kwargs.delete('method')

        headers = {}
        if kwargs.has_key? 'headers' then
          headers = kwargs['headers']
        end

        if ! GreenSMS.is_null_or_empty(@token) then
          headers['Authorization'] = 'Bearer ' + @token
        end

        params = {}

        @connection = Faraday.new(url: url) do |f|
          f.headers = headers
          f.adapter Faraday.default_adapter
        end

        if ! @default_params.empty? then
          @default_params.each { |name, value| params[name] = value }
        end

        if kwargs.has_key? 'params' then
          kwargs['params'].each { |name, value| params[name] = value }
        end

        resp = @connection.send(method.downcase.to_sym, url, params)
        puts resp.body

      end

    end
  end
end

