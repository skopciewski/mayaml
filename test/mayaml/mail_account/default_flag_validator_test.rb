require "test_helper"
require "mayaml/mail_account/default_flag_validator"

class MailAccountDefaultFlagValidatorTest < Minitest::Test
  def test_that_flag_is_valid_when_true_string_gitven
    validator = Mayaml::MailAccount::DefaultFlagValidator.new("true")
    assert_equal true, validator.valid?
  end

  def test_that_flag_is_valid_when_false_string_given
    validator = Mayaml::MailAccount::DefaultFlagValidator.new("false")
    assert_equal true, validator.valid?
  end

  def test_that_flag_is_valid_when_true_gitven
    validator = Mayaml::MailAccount::DefaultFlagValidator.new(true)
    assert_equal true, validator.valid?
  end

  def test_that_flag_is_valid_when_false_given
    validator = Mayaml::MailAccount::DefaultFlagValidator.new(false)
    assert_equal true, validator.valid?
  end

  def test_that_flag_is_invalid_when_unknown_string_given
    validator = Mayaml::MailAccount::DefaultFlagValidator.new('asd')
    assert_equal false, validator.valid?
  end
end
