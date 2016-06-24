require "test_helper"
require "mayaml/mail_account"

class MailAccountTest < Minitest::Test
  def setup
    @obj = Mayaml::MailAccount.new
    @obj.name = "test"
    @obj.type = :pop3
    @obj.server = "server.test.com"
    @obj.user = "user"
    @obj.pass = "pass"
    @obj.port = 777
    @obj.mailboxes = ["box"]
  end

  def test_object_creation
    assert_instance_of Mayaml::MailAccount, @obj
  end

  def test_that_can_set_default_type
    @obj.set_default_type
    assert_equal :imap, @obj.type
  end

  def test_that_can_set_default_port
    @obj.set_default_port
    assert_equal 993, @obj.port
  end

  def test_that_can_set_default_mailboxes
    @obj.set_default_mailboxes
    assert_equal [], @obj.mailboxes
  end

  def test_that_object_has_text_representation
    assert_match(/^\s*Account: test/, @obj.to_str)
  end
end
