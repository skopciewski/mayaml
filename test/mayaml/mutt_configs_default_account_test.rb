# frozen_string_literal: true

require "test_helper"

class MayamlMuttConfigsDefaultAccountTest < Minitest::Test
  include TestHelper

  def setup
    @account_1 = account_data(name: "acc1@foo.com", default: true)
    @account_2 = account_data(name: "acc2@foo.com")
    @account_3 = account_data(name: "acc3@foo.com")
    @accounts = [@account_1, @account_2]
    @accounts_without_default = [@account_2, @account_3]
    @prefix_path = "~/.mutt"
    @component = base.mutt_configs_default_account_handler
  end

  def teardown
  end

  def test_that_result_is_an_array
    result_for_accounts @accounts
    assert_instance_of(Array, @result)
  end

  def test_that_there_is_an_element_with_right_link_path
    result_for_accounts @accounts
    assert_equal(link_path, @result[0].keys.first)
  end

  def test_that_there_is_one_object
    result_for_accounts @accounts
    assert_equal(1, @result.size)
  end

  def test_that_there_is_right_value
    result_for_accounts @accounts
    assert_match(acc_path(1), @result[0].values.first)
  end

  def test_that_the_first_account_is_selected_with_no_default
    result_for_accounts @accounts_without_default
    assert_match(acc_path(2), @result[0].values.first)
  end

  private

  def result_for_accounts(accounts)
    @result = @component.execute accounts, @prefix_path
  end

  def link_path
    File.join(
      @prefix_path,
      base.default_accounts_dir,
      "current_acc"
    )
  end

  def acc_path(n)
    File.join(
      @prefix_path,
      base.default_accounts_dir,
      acc_name(n)
    )
  end

  def acc_name(n)
    instance_variable_get("@account_#{n}")[:name]
  end
end
