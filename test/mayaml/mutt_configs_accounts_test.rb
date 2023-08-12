# frozen_string_literal: true

require "test_helper"

class MayamlMuttConfigsAccountsTest < Minitest::Test
  include TestHelper

  def setup
    @account_1 = account_data(name: "acc1@foo.com")
    @account_2 = account_data(name: "acc2@foo.com")
    @accounts = [@account_1, @account_2]
    @prefix_path = "~/.mutt"
    @component = base.mutt_configs_accounts_handler
    @result = @component.execute @accounts, @prefix_path
  end

  def teardown
  end

  def test_that_resilt_is_an_array
    assert_instance_of(Array, @result)
  end

  def test_that_there_is_an_element_with_right_path
    assert_equal(acc1_path, @result[0].keys.first)
  end

  def test_that_there_are_two_objects
    assert_equal(2, @result.size)
  end

  private

  def acc1_path
    File.join(
      @prefix_path,
      base.default_accounts_dir,
      @account_1[:name]
    )
  end
end
