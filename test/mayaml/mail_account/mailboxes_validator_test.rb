require "test_helper"
require "mayaml/mail_account/mailboxes_validator"

class MailAccountMailboxesValidatorTest < Minitest::Test
  def test_that_mailboxes_are_valid_when_given
    validator = Mayaml::MailAccount::MailboxesValidator.new(%w(a b))
    assert_equal true, validator.valid?
  end

  def test_that_mailboxes_are_invalid_when_they_are_not_array
    validator = Mayaml::MailAccount::MailboxesValidator.new("foo")
    assert_equal false, validator.valid?
  end

  def test_that_mailboxes_are_invalid_when_they_are_empty
    validator = Mayaml::MailAccount::MailboxesValidator.new([])
    assert_equal false, validator.valid?
  end

  def test_that_mailboxes_are_invalid_when_they_are_not_array_of_strings
    validator = Mayaml::MailAccount::MailboxesValidator.new(["foo", :bar])
    assert_equal false, validator.valid?
  end
end
