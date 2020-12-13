require "test_helper"

class TokenTest < Minitest::Test
  def test_token_balance
    @client = Utility::CLIENT
    token_response = @client.account.token(expire: 5)
    @token_client = GreenSMS::GreenSMSClient.new(token: token_response["access_token"])
    resp = @token_client.account.balance
    assert_equal true, resp.has_key?("balance")
  end

  def test_raises_with_without_token
    assert_raises(StandardError) {
      @client = GreenSMS::GreenSMSClient.new
    }
  end

  def test_raises_with_token_expiry
    @client = Utility::CLIENT
    token_response = @client.account.token(expire: 5)
    @token_client = GreenSMS::GreenSMSClient.new(token: token_response["access_token"])

    sleep(6)

    error = assert_raises(StandardError) do
      @token_client.account.balance
    end
    assert_equal "Authorization declined", error.message
  end
end
