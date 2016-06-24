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
    class MailboxesValidator
      attr_reader :errors

      def initialize(mailboxes)
        @errors = []
        @errors << "Mailboxes should be array." unless mailboxes.instance_of? Array
        if mailboxes.instance_of?(Array) && mailboxes.empty?
          @errors << "Mailboxes can not be empty."
        end
        if mailboxes.instance_of?(Array) && !mailboxes.all? { |box| box.instance_of? String }
          @errors << "Mailboxes should all be strings."
        end
      end

      def valid?
        @errors.empty?
      end
    end
  end
end