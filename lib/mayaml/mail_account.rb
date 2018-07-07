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

module Mayaml
  class MailAccount
    attr_accessor :name, :default, :realname, :type, :server, :port, :user, :pass, \
                  :mailboxes, :smtp_protocol, :smtp_port, :smtp_authenticator, :smtp_server

    def initialize
      set_default_flag
      set_default_mailboxes
    end

    def set_default_flag
      @default = false
    end

    def set_default_mailboxes
      @mailboxes = []
    end

    def to_str
      default_mark = @default ? "*" : ""
      <<-DESC
        Account#{default_mark}: #{@name}<#{@realname}> | user: #{@user}:#{@pass}
          #{@type} - #{@server}:#{@port} [#{@mailboxes.join(",")}]
          #{@smtp_protocol} - #{@smtp_server}:#{@smtp_port} [auth: #{@smtp_authenticator}]
      DESC
    end
  end
end
