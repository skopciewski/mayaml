require "test_helper"
require "mayaml/mail_account/type_validator"

class MailAccountTypeValidatorTest < Minitest::Test
  def test_that_imap_type_is_valid
    validator = Mayaml::MailAccount::TypeValidator.new("imap")
    assert_equal true, validator.valid?
  end

  def test_that_pop3_type_is_valid
    validator = Mayaml::MailAccount::TypeValidator.new(:pop3)
    assert_equal true, validator.valid?
  end

  def test_that_validator_recognize_invalid_type
    validator = Mayaml::MailAccount::TypeValidator.new("foo")
    assert_equal false, validator.valid?
  end

  def test_that_validator_recognize_wrong_param
    validator = Mayaml::MailAccount::TypeValidator.new(nil)
    assert_equal false, validator.valid?
  end
end
