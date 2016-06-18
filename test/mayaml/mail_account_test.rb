require "test_helper"
require "mayaml/mail_account"

class MailAccountTest < Minitest::Test
  def setup
    @obj = Mayaml::MailAccount.new
  end

  def test_ocject_creation
    assert_instance_of Mayaml::MailAccount, @obj
  end
end
