require "test_helper"
require "mayaml/parser"

class ParserTest < Minitest::Test
  def test_that_parser_returns_empty_array_when_wrong_file_given
    json_accounts = "fake_file"
    assert_empty Mayaml::Parser.get_accounts(json_accounts)
  end

  def test_that_parser_returns_array
    json_accounts = File.join(TestHelper::SUPPORT_DIR, "accounts.yml")
    refute_empty Mayaml::Parser.get_accounts(json_accounts)
  end

  def test_that_parser_returns_empty_array_when_bad_yaml_given
    json_accounts = File.join(TestHelper::SUPPORT_DIR, "invalid_yaml.yml")
    assert_empty Mayaml::Parser.get_accounts(json_accounts)
  end
end
