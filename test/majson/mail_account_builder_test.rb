require "test_helper"
require "majson/mail_account_builder"

class MailAccountBuilderTest < Minitest::Test
  def test_build_account
    account = Majson::MailAccountBuilder.build do |builder|
      builder.set_name "test"
    end
    assert_instance_of Majson::MailAccount, account
  end
end
