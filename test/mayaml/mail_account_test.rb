require "test_helper"
require "mayaml/mail_account"

class MailAccountTest < Minitest::Test
  def setup
    @obj = Mayaml::MailAccount.new
    @obj.name = "test"
    @obj.default = true
    @obj.realname = "Jon Doe"
    @obj.type = :pop3
    @obj.server = "server.test.com"
    @obj.port = 777
    @obj.user = "user"
    @obj.pass = "pass"
    @obj.mailboxes = ["box"]
    @obj.smtp_protocol = :smtps
    @obj.smtp_port = 555
    @obj.smtp_authenticator = "login"
  end

  def test_object_creation
    assert_instance_of Mayaml::MailAccount, @obj
  end

  def test_that_can_set_default_mailboxes
    @obj.set_default_mailboxes
    assert_equal [], @obj.mailboxes
  end

  def test_that_can_set_default_flag
    @obj.set_default_flag
    assert_equal false, @obj.default
  end

  def test_that_object_has_text_representation
    assert_match(/^\s*Account\*: test/, @obj.to_str)
  end
end
