# frozen_string_literal: true

require "test_helper"
require "mayaml/mail_account/type_validator"

class MailAccountTypeValidatorTest < Minitest::Test
  def test_that_imap_type_is_valid
    validator = Mayaml::MailAccount::TypeValidator.new("imap")
    assert validator.valid?
  end

  def test_that_pop3_type_is_valid
    validator = Mayaml::MailAccount::TypeValidator.new(:pop3)
    assert validator.valid?
  end

  def test_that_imapssl_type_is_valid
    validator = Mayaml::MailAccount::TypeValidator.new("imapssl")
    assert validator.valid?
  end

  def test_that_pop3ssl_type_is_valid
    validator = Mayaml::MailAccount::TypeValidator.new(:pop3ssl)
    assert validator.valid?
  end

  def test_that_validator_recognize_invalid_type
    validator = Mayaml::MailAccount::TypeValidator.new("foo")
    refute validator.valid?
  end

  def test_that_validator_recognize_wrong_param
    validator = Mayaml::MailAccount::TypeValidator.new(nil)
    refute validator.valid?
  end
end
