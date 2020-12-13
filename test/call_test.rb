require "test_helper"

class CallTest < Minitest::Test
  @@resp = nil

  def test_send
    @client = Utility::CLIENT
    phone_number = Utility::random_phone_number
    resp = @client.call.send(to: phone_number)
    assert_equal true, resp.has_key?("request_id")
    @@resp = resp
  end

  def test_status
    @client = Utility::CLIENT
    sleep(3)
    resp = @client.call.status(id: @@resp["request_id"])
    assert_equal true, resp.has_key?("status")
  end

  def test_validation_error
    sleep(10) ## Ensure this assert runs last
    error = assert_raises(StandardError) do
      @client = Utility::CLIENT
      @client.call.send
    end
    assert_equal "Validation Error", error.message
  end
end
