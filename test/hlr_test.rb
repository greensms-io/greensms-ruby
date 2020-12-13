require "test_helper"

class HlrTest < Minitest::Test
  i_suck_and_my_tests_are_order_dependent!
  @@resp = nil

  def test_send
    @client = Utility::CLIENT
    phone_number = Utility::random_phone_number(79260000111, 79260999999)
    resp = @client.hlr.send(to: phone_number)
    assert_equal true, resp.has_key?("request_id")
    @@resp = resp
  end

  def test_status
    @client = Utility::CLIENT
    sleep(3)
    phone_number = Utility::random_phone_number
    resp = @client.hlr.status(id: @@resp["request_id"], to: phone_number)
    assert_equal true, resp.has_key?("status")
  end

  def test_validation_error
    error = assert_raises(StandardError) do
      @client = Utility::CLIENT
      @client.hlr.send
    end
    assert_equal "Validation Error", error.message
  end
end
