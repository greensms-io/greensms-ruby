module GreenSMS
  def GreenSMS.is_null_or_empty(input)
    if input.nil? then
      return true
    elsif input.empty? then
      return true
    else
      return false
    end
  end
end