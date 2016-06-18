require "test_helper"
require "mayaml"

class MayamlTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Mayaml::VERSION
  end
end
