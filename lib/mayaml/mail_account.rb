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

module Mayaml
  class MailAccount
    attr_accessor :name, :type, :server, :port, :user, :pass, :mailboxes

    def initialize
      set_default_type
      set_default_port
      set_default_mailboxes
    end

    def set_default_type
      @type = :imap
    end

    def set_default_port
      @port = 993
    end

    def set_default_mailboxes
      @mailboxes = []
    end

    def to_str
      <<-DESC
        Account: #{@name} | user: #{@user}:#{@pass}
          #{@type} - #{@server}:#{@port} [#{@mailboxes.join(",")}]
      DESC
    end
  end
end
