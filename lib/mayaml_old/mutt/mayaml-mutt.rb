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

require "mayaml"
require "mayaml-mutt/version"
require "mayaml-mutt/configs_generator"
require "mayaml-mutt/account_creds"
require "mayaml-mutt/account_init"
require "mayaml-mutt/accounts_alternates"

module MayamlMutt
  def self.accounts_init_from_file(yaml_accounts)
    accounts = ::Mayaml.accounts_from_file(yaml_accounts)
    generator.generates_init(accounts)
  end

  def self.accounts_creds_from_file(yaml_accounts)
    accounts = ::Mayaml.accounts_from_file(yaml_accounts)
    generator.generates_creds(accounts)
  end

  def self.generator
    ConfigsGenerator.new(AccountInit.new, AccountsAlternates.new, AccountCreds.new)
  end
end
