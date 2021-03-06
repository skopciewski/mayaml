# frozen_string_literal: true

require "test_helper"
require "mayaml/mail_account/smtp_protocol_validator"

class MailAccountSmtpProtocolValidatorTest < Minitest::Test
  def test_that_smtp_type_is_valid
    validator = Mayaml::MailAccount::SmtpProtocolValidator.new("smtp")
    assert validator.valid?
  end

  def test_that_smtps_type_is_valid
    validator = Mayaml::MailAccount::SmtpProtocolValidator.new(:smtps)
    assert validator.valid?
  end

  def test_that_validator_recognize_invalid_type
    validator = Mayaml::MailAccount::SmtpProtocolValidator.new("foo")
    refute validator.valid?
  end

  def test_that_validator_recognize_wrong_param
    validator = Mayaml::MailAccount::SmtpProtocolValidator.new(nil)
    refute validator.valid?
  end
end
