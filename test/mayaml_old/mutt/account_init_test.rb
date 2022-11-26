# frozen_string_literal: true

require "test_helper"
require "mayaml-mutt/account_init"
require "mayaml/mail_account"

class MayamlMuttAccountInitTest < Minitest::Test
  def setup
    @account = ::Mayaml::MailAccount.new
    @account.name = "test-name@test.com"
    @account.realname = "Joe Doe"
    @account.server = "test.test.com"
    @account.port = 999
    @account.user = "user"
    @account.user = "pass"
    @account.mailboxes = %w[a b]
    @account.smtp_protocol = "smpts"
    @account.smtp_port = 444
    @account.smtp_authenticator = "login"
    @account.smtp_server = "test.test.org"
    @generator = ::MayamlMutt::AccountInit.new
    @config = @generator.render(@account, 1)
  end

  def test_that_template_has_send_hook_line
    assert_match(%r{^send-hook .*source .*/#{@account.name}}, @config)
  end

  def test_that_template_has_send2_hook_line
    assert_match(%r{^send2-hook .*source .*/#{@account.name}}, @config)
  end

  def test_that_template_has_alias_line
    assert_match(/^alias my_account_1_#{@account.name.gsub(/\W/, '_')} #{@account.name}/, @config)
  end
end
