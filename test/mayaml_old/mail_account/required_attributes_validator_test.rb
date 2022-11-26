# frozen_string_literal: true

require "test_helper"
require "mayaml/mail_account"
require "mayaml/mail_account/required_attributes_validator"

class MailAccountRequiredAttributesValidatorTest < Minitest::Test
  def valid_account
    account = Mayaml::MailAccount.new
    account.name = "name"
    account.realname = "Jon Doe"
    account.type = :imap
    account.server = "server.com"
    account.port = 998
    account.user = "user"
    account.pass = "pass"
    account.smtp_protocol = :smtp
    account.smtp_port = 555
    account.smtp_authenticator = "login"
    account.smtp_server = "server.com"
    account
  end

  def test_that_good_object_is_valid
    validator = Mayaml::MailAccount::RequiredAttributesValidator.new(valid_account)
    assert validator.valid?
  end

  def test_that_valid_object_does_not_have_errors
    validator = Mayaml::MailAccount::RequiredAttributesValidator.new(valid_account)
    assert_empty validator.errors
  end

  def test_that_oject_is_invalid_when_missing_name
    account = valid_account
    account.name = nil
    validator = Mayaml::MailAccount::RequiredAttributesValidator.new(account)
    refute validator.valid?
  end

  def test_that_invalid_object_has_errors
    account = Mayaml::MailAccount.new
    account.server = "server.com"
    account.user = "user"
    account.pass = "pass"
    validator = Mayaml::MailAccount::RequiredAttributesValidator.new(account)
    refute_empty validator.errors
  end

  def test_that_invalid_object_has_many_errors
    account = Mayaml::MailAccount.new
    validator = Mayaml::MailAccount::RequiredAttributesValidator.new(account)
    assert_operator 1, :<, validator.errors.count
  end

  def test_that_oject_is_invalid_when_missing_realname
    account = valid_account
    account.realname = nil
    refute Mayaml::MailAccount::RequiredAttributesValidator.new(account).valid?
  end

  def test_that_oject_is_invalid_when_missing_type
    account = valid_account
    account.type = nil
    refute Mayaml::MailAccount::RequiredAttributesValidator.new(account).valid?
  end

  def test_that_oject_is_invalid_when_missing_server
    account = valid_account
    account.server = nil
    refute Mayaml::MailAccount::RequiredAttributesValidator.new(account).valid?
  end

  def test_that_oject_is_invalid_when_missing_user
    account = valid_account
    account.user = nil
    refute Mayaml::MailAccount::RequiredAttributesValidator.new(account).valid?
  end

  def test_that_oject_is_invalid_when_missing_pass
    account = valid_account
    account.pass = nil
    refute Mayaml::MailAccount::RequiredAttributesValidator.new(account).valid?
  end

  def test_that_oject_is_invalid_when_missing_smtp_protocol
    account = valid_account
    account.smtp_protocol = nil
    refute Mayaml::MailAccount::RequiredAttributesValidator.new(account).valid?
  end

  def test_that_oject_is_invalid_when_missing_smtp_port
    account = valid_account
    account.smtp_port = nil
    refute Mayaml::MailAccount::RequiredAttributesValidator.new(account).valid?
  end

  def test_that_oject_is_invalid_when_missing_smtp_authenticator
    account = valid_account
    account.smtp_authenticator = nil
    refute Mayaml::MailAccount::RequiredAttributesValidator.new(account).valid?
  end

  def test_that_oject_is_invalid_when_missing_smtp_server
    account = valid_account
    account.smtp_server = nil
    refute Mayaml::MailAccount::RequiredAttributesValidator.new(account).valid?
  end
end
