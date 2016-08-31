require "test_helper"
require "mayaml/mail_account/builder"

class MailAccountBuilderTest < Minitest::Test
  def setup
    @account = valid_account
    @account_defaults = default_account
  end

  def valid_account
    Mayaml::MailAccount::Builder.build do |builder|
      builder.name "test"
      builder.default "true"
      builder.realname "realname"
      builder.type "pop3"
      builder.server "test.test.com"
      builder.port "999"
      builder.user "bolo"
      builder.pass "pass"
      builder.mailboxes %w(a, b)
    end
  end

  def default_account
    Mayaml::MailAccount::Builder.build do |builder|
      builder.name "test"
      builder.realname "realname"
      builder.type "imap"
      builder.server "test.test.com"
      builder.port "993"
      builder.user "bolo"
      builder.user "bolo"
      builder.pass "pass"
    end
  end

  def test_that_builder_raises_error_when_building_incomplete_account
    assert_raises Mayaml::MailAccount::MissingAttributes do
      Mayaml::MailAccount::Builder.new.account
    end
  end

  def test_that_account_has_right_name
    assert_equal "test", @account.name
  end

  def test_that_account_has_default_flag_converted_to_bool
    assert_equal true, @account.default
  end

  def test_that_account_has_type_converted_to_sym
    assert_equal :pop3, @account.type
  end

  def test_that_account_has_right_server
    assert_equal "test.test.com", @account.server
  end

  def test_that_account_has_port_converted_to_int
    assert_equal 999, @account.port
  end

  def test_that_account_has_right_user
    assert_equal "bolo", @account.user
  end

  def test_that_account_has_right_pass
    assert_equal "pass", @account.pass
  end

  def test_that_account_has_right_mailboxes
    assert_equal "b", @account.mailboxes[1]
  end

  def test_that_account_has_default_flag
    assert_equal false, @account_defaults.default
  end

  def test_that_account_has_default_mailboxes
    assert_empty @account_defaults.mailboxes
  end

  def test_that_builder_raises_error_when_wrong_default_flag_given
    assert_raises Mayaml::MailAccount::WrongDefaultFlag do
      Mayaml::MailAccount::Builder.build { |builder| builder.default "xxx" }
    end
  end

  def test_that_builder_raises_error_when_wrong_type_given
    assert_raises Mayaml::MailAccount::WrongAccountType do
      Mayaml::MailAccount::Builder.build { |builder| builder.type "xxx" }
    end
  end

  def test_that_builder_raises_error_when_wrong_port_given
    assert_raises Mayaml::MailAccount::WrongAccountPort do
      Mayaml::MailAccount::Builder.build { |builder| builder.port "xxx" }
    end
  end

  def test_that_builder_raises_error_when_wrong_mailboxes_given
    assert_raises Mayaml::MailAccount::WrongAccountMailboxes do
      Mayaml::MailAccount::Builder.build { |builder| builder.mailboxes :foo }
    end
  end

  def test_that_setting_empty_mailboxes_gives_account_with_default_value
    account = Mayaml::MailAccount::Builder.build do |builder|
      builder.mailboxes []
      builder.name "test"
      builder.realname "realname"
      builder.type "pop3"
      builder.server "test.test.com"
      builder.port "999"
      builder.user "bolo"
      builder.pass "pass"
    end
    assert_equal [], account.mailboxes
  end
end
