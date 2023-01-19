# frozen_string_literal: true

require "test_helper"

class MayamlMuttAccountInitTest < Minitest::Test
  include TestHelper

  def setup
    @account_data = account_data
    @component = base.mutt_account_init_generator
    @view = @component.render @account_data
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
      %r{^alias my_account_#{index}_#{clean_account_name} #{account_name}},
      @view
    )
  end

  %i[name index].each do |value|
    define_method "test_that_exception_raises_with_missing_#{value}" do
      invalid_data = @account_data.reject { |k, _| k == value }
      assert_raises(ArgumentError) { @component.render invalid_data }
    end
  end

  private

  def account_name
    @account_data[:name]
  end

  def index
    @account_data[:index]
  end

  def clean_account_name
    account_name.gsub(/\W/, "_")
  end
end
