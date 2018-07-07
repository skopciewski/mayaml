# frozen_string_literal: true

require "test_helper"
require "mayaml/mail_account/mailboxes_validator"

class MailAccountMailboxesValidatorTest < Minitest::Test
  def test_that_mailboxes_are_valid_when_given
    validator = Mayaml::MailAccount::MailboxesValidator.new(%w[a b])
    assert validator.valid?
  end

  def test_that_mailboxes_are_invalid_when_they_are_not_array
    validator = Mayaml::MailAccount::MailboxesValidator.new("foo")
    refute validator.valid?
  end

  def test_that_mailboxes_are_invalid_when_they_are_empty
    validator = Mayaml::MailAccount::MailboxesValidator.new([])
    refute validator.valid?
  end

  def test_that_mailboxes_are_invalid_when_they_are_not_array_of_strings
    validator = Mayaml::MailAccount::MailboxesValidator.new(["foo", :bar])
    refute validator.valid?
  end
end
