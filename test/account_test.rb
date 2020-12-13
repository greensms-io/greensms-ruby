require "test_helper"

class AccountTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::GreenSMS::VERSION
  end

  def test_account_balance
    @client = Utility::CLIENT
    resp = @client.account.balance
    assert_equal true, resp.has_key?("balance")
  end

  def test_access_token
    @client = Utility::CLIENT
    resp = @client.account.token(expire: 5)
    assert_equal true, resp.has_key?("access_token")
  end

  def test_tariff
    @client = Utility::CLIENT
    resp = @client.account.tariff
    assert_operator 0, :<, resp.length()
  end

  def test_raises_exception_on_no_creds
    assert_raises(StandardError) {
      @client = GreenSMS::GreenSMSClient.new
    }
  end

  def test_raises_exception_on_invalid_creds
    error = assert_raises(StandardError) do
      @client = GreenSMS::GreenSMSClient.new(user: "xyz", pass: "abcd")
      @client.account.balance
    end
    assert_equal "Authorization declined", error.message
  end

  def test_raises_exception_on_insufficient_funds
    error = assert_raises(StandardError) do
      @client = GreenSMS::GreenSMSClient.new(user: "test_block_user", pass: "183456")
      phone_number = Utility::random_phone_number
      @client.sms.send(to: phone_number, txt: "1211")
    end
    assert_equal "Insufficient funds", error.message
  end
end
