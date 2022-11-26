# frozen_string_literal: true

require "test_helper"
require "mayaml-mutt"

class MayamlMuttTest < Minitest::Test
  def setup
    @yaml_accounts = "fake.yml"
  end

  def test_that_it_has_a_version_number
    refute_nil ::MayamlMutt::VERSION
  end

  def test_that_it_returns_empty_init_hash_for_fake_file
    configs = MayamlMutt.accounts_init_from_file(@yaml_accounts)
    assert_empty configs
  end

  def test_that_it_returns_empty_creds_hash_for_fake_file
    configs = MayamlMutt.accounts_creds_from_file(@yaml_accounts)
    assert_empty configs
  end
end
