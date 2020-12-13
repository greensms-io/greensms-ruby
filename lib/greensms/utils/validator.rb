require "json-schema"
require "greensms/http/error"

module GreenSMS
  def GreenSMS.validate(schema, data)
    res = JSON::Validator.fully_validate(schema, data, :errors_as_objects => true)
    if !res.nil? && res.length > 0
      raise RestError.new("Validation Error", 1, res)
    end
    return nil
  end
end
