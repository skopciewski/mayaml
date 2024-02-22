# frozen_string_literal: true

require "test_helper"

class MayamlTest < Minitest::Test
  def setup
  end

  def teardown
  end

  def test_that_it_has_a_version_number
    refute_nil ::Mayaml::VERSION
  end
end
