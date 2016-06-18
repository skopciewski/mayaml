require "test_helper"
require "majson"

class MajsonTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Majson::VERSION
  end
end
