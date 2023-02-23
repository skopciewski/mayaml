# frozen_string_literal: true

require "test_helper"

class MayamlMuttAccountCredsTest < Minitest::Test
  include TestHelper

  def setup
    @account_data = account_data
    @component = base.mutt_account_creds_generator
    @view = @component.render @account_data
  end

  def teardown
  end

  def test_that_template_has_pass_value
    assert_match(%r{ smtp_pass="#{pass}"}, @view)
  end

  def test_that_template_has_ssl_starttls_value
    assert_match(%r{^set ssl_starttls=yes}, @view)
  end

  def test_that_template_has_forcetls_value
    assert_match(%r{^set ssl_force_tls=yes}, @view)
  end

  %i[realname from smtp_url smtp_authenticators].each do |value|
    define_method "test_that_template_has_right_#{value}_value" do
      assert_match(%r{^set #{value}="#{send value}"}, @view)
    end
  end

  %i[realname name smtp_protocol smtp_server smtp_port smtp_authenticator
    user pass].each do |value|
    define_method "test_that_exception_raises_with_missing_#{value}" do
      invalid_data = @account_data.except(value)
      assert_raises(ArgumentError) { @component.render invalid_data }
    end
  end

  private

  def realname
    @account_data[:realname]
  end

  def from
    @account_data[:name]
  end

  def smtp_url
    "#{@account_data[:smtp_protocol]}://#{@account_data[:user]}@" \
      "#{@account_data[:smtp_server]}:#{@account_data[:smtp_port]}/"
  end

  def smtp_authenticators
    @account_data[:smtp_authenticator]
  end

  def pass
    @account_data[:pass]
  end
end
