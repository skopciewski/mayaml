require "test_helper"
require "mayaml/parser"

class ParserTest < Minitest::Test
  def setup
    @json_accounts = "fake_file"
  end

  def test_that_parser_returns_array
    assert_instance_of Array, Mayaml::Parser.get_accounts(@json_accounts)
  end

  def test_that_parser_returns_empty_array_when_wrong_file_given
    assert_empty Mayaml::Parser.get_accounts(@json_accounts)
  end
end
