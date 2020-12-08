require "cgi"
require "faraday"
require "json"
require "greensms/utils/str"
require "greensms/http/error"

module GreenSMS
  module Http
    class Client
      def initialize(opts)
        @token = nil
        @default_data = {}
        @default_params = {}
        @use_camel_case = false

        opts.each { |name, value| instance_variable_set("@#{name}", value) }
      end

      def request(kwargs)
        if !kwargs.has_key? "method"
          raise StandardError.new "Http Method is required"
        end
        method = kwargs["method"]

        if !kwargs.has_key? "url"
          raise StandardError.new "URL is required"
        end

        url = kwargs["url"]

        kwargs.delete("url")
        kwargs.delete("method")

        headers = {}
        if kwargs.has_key? "headers"
          kwargs["headers"].each { |name, value| headers[name] = value }
        end

        if !GreenSMS.is_null_or_empty(@token)
          headers["Authorization"] = "Bearer " + @token
        end

        params = {}

        @connection = Faraday.new(url: url) do |f|
          f.request :multipart
          f.request :url_encoded
          f.headers = headers
          f.adapter Faraday.default_adapter
        end

        if !@default_params.empty?
          @default_params.each { |name, value| params[name] = value }
        end

        if kwargs.has_key? "params"
          kwargs["params"].each { |name, value| params[name] = value }
        end

        d = {}
        if method == "POST"
          d = d.to_json
        end

        url = url + "?" + hash_to_query(params)

        resp = @connection.send(method.downcase.to_sym, url, d)
        resp = JSON.parse resp.body
        if resp.has_key? "error"
          raise RestError.new(resp["error"], resp["code"])
        end

        if @use_camel_case
          resp = GreenSMS.camelize(resp)
        end

        return resp
      end

      private

      def hash_to_query(hash)
        return CGI.escape(hash.map { |k, v| "#{k}=#{v}" }.join("&"))
      end
    end
  end
end
