# frozen_string_literal: true

require "test_helper"

class MayamlMuttConfigsStaticTest < Minitest::Test
  include TestHelper

  def setup
    @prefix_path = "~/.mutt"
    @component = base.mutt_configs_static_handler
    @result = @component.execute @prefix_path
    @keys = %w[account_chooser.sh csk.muttrc mailcap muttrc]
  end

  def teardown
  end

  def test_that_result_is_an_array
    assert_instance_of(Array, @result)
  end

  def test_that_there_are_right_configs
    @keys.each do |config_file|
      assert(key_exist?(path_to(config_file), @result))
    end
  end

  private

  def path_to(file)
    File.join(
      @prefix_path,
      file
    )
  end

  def key_exist?(key, data)
    data.any? { |hsh|
      hsh.keys.first == key
    }
  end
end
