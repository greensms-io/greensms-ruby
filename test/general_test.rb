require "test_helper"

class GeneralTest < Minitest::Test
  def test_lookup
    @client = Utility::CLIENT
    resp = @client.whois.lookup(to: "79260000000")
    has_def = resp.has_key?("def")
    has_region = resp.has_key?("region")
    assert_equal true, has_def && has_region
  end

  def test_status
    @client = Utility::CLIENT
    sleep(3)
    resp = @client.status
    assert_equal true, resp.has_key?("status")
  end
end
