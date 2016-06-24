require "test_helper"
require "mayaml/mail_account"
require "mayaml/mail_account/required_attributes_validator"

class MailAccountRequiredAttributesValidatorTest < Minitest::Test
  def valid_account
    account = Mayaml::MailAccount.new
    account.name = "name"
    account.server = "server.com"
    account.user = "user"
    account.pass = "pass"
    account
  end

  def test_that_good_object_is_valid
    validator = Mayaml::MailAccount::RequiredAttributesValidator.new(valid_account)
    assert_equal true, validator.valid?
  end

  def test_that_valid_object_do_not_have_errors
    validator = Mayaml::MailAccount::RequiredAttributesValidator.new(valid_account)
    assert_empty validator.errors
  end

  def test_that_oject_is_invalid_when_missing_name
    account = Mayaml::MailAccount.new
    account.server = "server.com"
    account.user = "user"
    account.pass = "pass"
    validator = Mayaml::MailAccount::RequiredAttributesValidator.new(account)
    assert_equal false, validator.valid?
  end

  def test_that_invalid_object_have_errors
    account = Mayaml::MailAccount.new
    account.server = "server.com"
    account.user = "user"
    account.pass = "pass"
    validator = Mayaml::MailAccount::RequiredAttributesValidator.new(account)
    refute_empty validator.errors
  end

  def test_that_oject_is_invalid_when_missing_server
    account = Mayaml::MailAccount.new
    account.name = "name"
    account.user = "user"
    account.pass = "pass"
    validator = Mayaml::MailAccount::RequiredAttributesValidator.new(account)
    assert_equal false, validator.valid?
  end

  def test_that_oject_is_invalid_when_missing_user
    account = Mayaml::MailAccount.new
    account.name = "name"
    account.server = "server.com"
    account.pass = "pass"
    validator = Mayaml::MailAccount::RequiredAttributesValidator.new(account)
    assert_equal false, validator.valid?
  end

  def test_that_oject_is_invalid_when_missing_pass
    account = Mayaml::MailAccount.new
    account.name = "name"
    account.server = "server.com"
    account.user = "user"
    validator = Mayaml::MailAccount::RequiredAttributesValidator.new(account)
    assert_equal false, validator.valid?
  end

  def test_that_invalid_object_have_many_errors
    account = Mayaml::MailAccount.new
    validator = Mayaml::MailAccount::RequiredAttributesValidator.new(account)
    assert_operator 1, :<, validator.errors.count
  end
end
