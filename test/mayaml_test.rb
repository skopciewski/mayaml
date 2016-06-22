require "test_helper"
require "mayaml"

class MayamlTest < Minitest::Test
  def setup
    yaml_accounts = File.join(TestHelper::SUPPORT_DIR, "accounts.yml")
    @accounts = Mayaml.accounts_from_file(yaml_accounts)
  end

  def test_that_it_has_a_version_number
    refute_nil ::Mayaml::VERSION
  end

  def test_that_it_returns_array
    assert_instance_of Array, @accounts
  end

  def test_that_it_returns_array_of_mail_accounts
    assert_instance_of Mayaml::MailAccount, @accounts.first
  end
end
