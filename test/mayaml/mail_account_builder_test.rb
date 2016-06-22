require "test_helper"
require "mayaml/mail_account_builder"

class MailAccountBuilderTest < Minitest::Test
  def test_build_account
    account = Mayaml::MailAccountBuilder.build do |builder|
      builder.name "test"
      builder.type "imap"
      builder.server "test.test.com"
      builder.port 999
      builder.user "bolo"
      builder.pass "pass"
      builder.mailboxes %w(a, b)
    end
    assert_instance_of Mayaml::MailAccount, account
  end
end
