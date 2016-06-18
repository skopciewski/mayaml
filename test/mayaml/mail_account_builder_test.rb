require "test_helper"
require "mayaml/mail_account_builder"

class MailAccountBuilderTest < Minitest::Test
  def test_build_account
    account = Mayaml::MailAccountBuilder.build do |builder|
      builder.set_name "test"
    end
    assert_instance_of Mayaml::MailAccount, account
  end
end
