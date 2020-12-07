module GreenSMS
  class RestError < StandardError
    attr_reader :params
    attr_reader :code
    attr_reader :error_type

    def initialize(msg = "RestError", code = 9, params = {})
      @code = code
      @name = "RestError"
      @params = params
      @error_type = _get_error_type(code)
      super(msg)
    end

    private
    def _get_error_type(code)
      case code
      when 0
        return "AUTH_DECLINED"
      when 1
        return "MISSING_INPUT_PARAM"
      when 2
        return "INVALID_INPUT_PARAM"
      when 404
        return "NOT_FOUND"
      else
        return "INTERNAL_SERVER_ERROR"
      end
    end
  end
end