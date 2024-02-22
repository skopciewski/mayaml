# frozen_string_literal: true

require "test_helper"

class MayamlMuttConfigsInitTest < Minitest::Test
  include TestHelper

  def setup
    @account_1 = account_data(name: "acc1@foo.com")
    @account_2 = account_data(name: "acc2@foo.com")
    @accounts = [@account_1, @account_2]
    @prefix_path = "~/.mutt"
    @component = base.mutt_configs_init_handler
    @result = @component.execute @accounts, @prefix_path
  end

  def teardown
  end

  def test_that_result_is_an_array
    assert_instance_of(Array, @result)
  end

  def test_that_there_is_an_element_with_right_path
    assert_equal(init_path, @result[0].keys.first)
  end

  def test_that_there_is_one_objects
    assert_equal(1, @result.size)
  end

  def test_that_there_are_right_accounts
    assert_match("send-hook '~f ^#{acc1_name}'", @result[0].values.first)
    assert_match("send-hook '~f ^#{acc2_name}'", @result[0].values.first)
  end

  def test_that_there_are_right_alternates
    assert_match("alternates #{acc1_name} #{acc2_name}", @result[0].values.first)
  end

  private

  def init_path
    File.join(
      @prefix_path,
      "init.muttrc"
    )
  end

  def acc1_name
    @account_1[:name]
  end

  def acc2_name
    @account_2[:name]
  end
end
