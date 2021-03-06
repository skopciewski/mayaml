# frozen_string_literal: true

# Copyright (C) 2016, 2017, 2018 Szymon Kopciewski
#
# This file is part of Mayaml.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

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
