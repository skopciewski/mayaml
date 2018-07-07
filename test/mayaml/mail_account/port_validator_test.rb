# frozen_string_literal: true

require "test_helper"
require "mayaml/mail_account/port_validator"

class MailAccountPortValidatorTest < Minitest::Test
  def test_that_port_is_valid_when_int_given
    validator = Mayaml::MailAccount::PortValidator.new(99)
    assert validator.valid?
  end

  def test_that_port_is_valid_when_string_with_int_given
    validator = Mayaml::MailAccount::PortValidator.new("99")
    assert validator.valid?
  end

  def test_that_port_is_invalid_when_zero_given
    validator = Mayaml::MailAccount::PortValidator.new(0)
    refute validator.valid?
  end

  def test_that_port_is_invalid_when_negative_given
    validator = Mayaml::MailAccount::PortValidator.new("-2")
    refute validator.valid?
  end

  def test_that_port_is_invalid_when_wrong_param_given
    validator = Mayaml::MailAccount::PortValidator.new(:foo)
    refute validator.valid?
  end
end
