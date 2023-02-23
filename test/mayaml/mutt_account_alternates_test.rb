# frozen_string_literal: true

require "test_helper"

class MayamlMuttAccountAlternatesTest < Minitest::Test
  include TestHelper

  def setup
    @accounts = %w[name1 name2]
    @component = base.mutt_account_alternates_generator
    @view = @component.render @accounts
  end

  def teardown
  end

  def test_that_template_has_alternates_value
    assert_match(/^alternates #{accounts}/, @view)
  end

  def test_that_exception_raises_with_missing_accounts
    invalid_data = nil
    assert_raises(ArgumentError) { @component.render invalid_data }
  end

  def test_that_exception_raises_with_empty_accounts
    invalid_data = []
    assert_raises(ArgumentError) { @component.render invalid_data }
  end

  def test_that_exception_raises_with_invalid_accounts
    invalid_data = "foo"
    assert_raises(ArgumentError) { @component.render invalid_data }
  end

  private

  def accounts
    @accounts.join(" ")
  end
end
