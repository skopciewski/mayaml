require "test_helper"
require "majson/mail_account"

class MailAccountTest < Minitest::Test
  def setup
    @obj = Majson::MailAccount.new
  end

  def test_ocject_creation
    assert_instance_of Majson::MailAccount, @obj
  end
end
