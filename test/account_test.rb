require "test_helper"

class AccountTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::GreenSMS::VERSION
  end

  # def test_it_does_something_useful
  #   assert false
  # end
end
