require "test_helper"

class SmsTest < Minitest::Test
  i_suck_and_my_tests_are_order_dependent!
  @@resp = nil

  def test_send
    @client = Utility::CLIENT
    phone_number = Utility::random_phone_number
    resp = @client.sms.send(to: phone_number, txt: "Hello Mesage Private", from: "RubyTest", tag: "SmsTest", hidden: "Private")
    assert_equal true, resp.has_key?("request_id")
    @@resp = resp
  end

  def test_status
    @client = Utility::CLIENT
    sleep(3)
    resp = @client.sms.status(id: @@resp["request_id"], extended: true)
    assert_equal true, resp.has_key?("status")
  end

  def test_validation_error
    error = assert_raises(StandardError) do
      @client = Utility::CLIENT
      @client.sms.send
    end
    assert_equal "Validation Error", error.message
  end
end
