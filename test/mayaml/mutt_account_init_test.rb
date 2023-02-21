# frozen_string_literal: true

require "test_helper"

class MayamlMuttAccountInitTest < Minitest::Test
  include TestHelper

  def setup
    @account_data = account_data
    @index = 1
    @component = base.mutt_account_init_generator
    @view = @component.render @index, @account_data
  end

  def teardown
  end

  def test_that_template_has_send_hook_line
    assert_match(%r{^send-hook .*source .*/#{account_name}}, @view)
  end

  def test_that_template_has_send2_hook_line
    assert_match(%r{^send2-hook .*source .*/#{account_name}}, @view)
  end

  def test_that_template_has_alias_line
    assert_match(
      %r{^alias my_account_#{@index}_#{clean_account_name} #{account_name}},
      @view
    )
  end

  def test_that_exception_raises_with_missing_name
    invalid_data = @account_data.except(:name)
    assert_raises(ArgumentError) { @component.render @index, invalid_data }
  end

  private

  def account_name
    @account_data[:name]
  end

  def clean_account_name
    account_name.gsub(/\W/, "_")
  end
end
