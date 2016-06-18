# encoding: utf-8

# Copyright (C) 2016 Szymon Kopciewski
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
require "mayaml/mail_account"

module Mayaml
  class MailAccountBuilder
    def self.build
      builder = new
      yield(builder)
      builder.account
    end

    def initialize
      @account = MailAccount.new
    end

    def name(name)
      @account.name = name
    end

    def type(str)
      @account.type = str.to_sym
    end

    def server(str)
      @account.server = str
    end

    def port(nr)
      @account.port = nr.to_i
    end

    def user(str)
      @account.user = str
    end

    def pass(str)
      @account.pass = str
    end

    def mailboxes(arr)
      @account.mailboxes = arr
    end

    def account
      obj = @account.dup
      @account = MailAccount.new
      obj
    end
  end
end
