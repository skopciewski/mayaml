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
  class AccountInit
    def render(mail_account, index, config = {})
      ::Mustache.render(
        IO.read(template_file_path),
        name: mail_account.name,
        clean_name: clean_name(mail_account.name, index),
        accounts_dir: config.fetch(:accounts_dir, "~/.mutt/accounts")
      )
    end

    private

    def template_file_path
      templates_dir = File.expand_path("../templates", __dir__)
      File.join(templates_dir, "account_init.mustache")
    end

    def clean_name(string, index)
      "#{index}_#{string.gsub(/\W/, "_")}"
    end
  end
end
