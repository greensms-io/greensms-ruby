require "greensms/constants"
require "greensms/utils/str"

module GreenSMS
  def GreenSMS.base_url()
    return GreenSMS::BASE_URL
  end

  def GreenSMS.build_url(base_url, url_parts)
    if GreenSMS.is_null_or_empty(base_url) then
      raise StandardError.new "Base URL cannot be empty"
    end

    url = base_url + "/" + url_parts.join("/")
    return url

  end
end