# frozen_string_literal: true

require "mayaml/version"
require "mayaml/mail_account/builder"
require "mayaml/parser"

module Mayaml
  def self.accounts_from_file(yaml_accounts)
    raw_accounts = Parser.get_accounts(yaml_accounts)
    raw_accounts.map do |raw_account|
      build_account(raw_account)
    end
  end

  def self.build_account(raw_account)
    MailAccount::Builder.build do |builder|
      builder.name raw_account.fetch("name")
      builder.default raw_account.fetch("default", "")
      builder.realname raw_account.fetch("realname")
      builder.type raw_account.fetch("type")
      builder.server raw_account.fetch("server")
      builder.port raw_account.fetch("port")
      builder.user raw_account.fetch("user")
      builder.pass raw_account.fetch("pass")
      builder.mailboxes raw_account.fetch("mailboxes", [])
      builder.smtp_protocol raw_account.fetch("smtp_protocol")
      builder.smtp_port raw_account.fetch("smtp_port")
      builder.smtp_authenticator raw_account.fetch("smtp_authenticator")
      builder.smtp_server raw_account.fetch("smtp_server")
    end
  end
end
