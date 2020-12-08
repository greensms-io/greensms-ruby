require "greensms/constants"
require "greensms/utils/str"

module GreenSMS
  def GreenSMS.get_version(version)
    if GreenSMS::is_null_or_empty(version) then
      version = GreenSMS::VERSIONS['v1']
    end

    version = version.downcase
    if GreenSMS::VERSIONS.has_key? version then
      version = GreenSMS::VERSIONS[version]
    else
      raise StandardError.new "Invalid Version"
    end
    return version
  end
end