# frozen_string_literal: true

require "test_helper"
require "mayaml-mutt/accounts_alternates"
require "mayaml/mail_account"

class MayamlMuttAccountsAlternatesTest < Minitest::Test
  def setup
    @generator = ::MayamlMutt::AccountsAlternates.new
  end

  def test_that_template_has_right_alternates
    accounts = %w[acc1 acc2]
    config = @generator.render(accounts)
    assert_match(/^alternates #{accounts.join(' ')}/, config)
  end

  def test_that_template_is_empty_when_no_accounts_given
    accounts = []
    config = @generator.render(accounts)
    assert_equal "", config
  end

  def test_that_template_is_empty_when_nil_given
    accounts = nil
    config = @generator.render(accounts)
    assert_equal "", config
  end
end
