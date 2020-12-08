module GreenSMS
  def GreenSMS.is_null_or_empty(input)
    if input.nil?
      return true
    elsif input.empty?
      return true
    else
      return false
    end
  end

  def GreenSMS.camelize(value)
    case value
    when Array
      value.map { |v| GreenSMS.camelize(v) }
    when Hash
      Hash[value.map { |k, v| [GreenSMS.camelize(k), GreenSMS.camelize(v)] }]
    when String
      value.split("_").inject { |m, p| m + p.capitalize }
    else
      value
    end
  end
end
