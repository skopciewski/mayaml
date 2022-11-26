# frozen_string_literal: true

# Copyright (C) 2016, 2017, 2018 Szymon Kopciewski
#
# This file is part of MayamlMutt.
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

require "mustache"

module MayamlMutt
  class AccountCreds
    def render(mail_account)
      ::Mustache.render(
        IO.read(template_file_path),
        name: mail_account.name,
        realname: mail_account.realname,
        user: mail_account.user,
        pass: mail_account.pass,
        server: mail_account.server,
        smtp_protocol: mail_account.smtp_protocol,
        smtp_port: mail_account.smtp_port,
        smtp_authenticator: mail_account.smtp_authenticator,
        smtp_server: mail_account.smtp_server
      )
    end

    private

    def template_file_path
      templates_dir = File.expand_path("../templates", __dir__)
      File.join(templates_dir, "account_creds.mustache")
    end
  end
end
