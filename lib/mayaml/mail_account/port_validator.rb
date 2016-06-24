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
    class PortValidator
      attr_reader :errors

      def initialize(port)
        @errors = []
        port = port.respond_to?(:to_i) ? port.to_i : 0
        @errors << "Mail account port is invalid." if port == 0
        @errors << "Mail account port could not be negative." if port < 0
      end

      def valid?
        @errors.empty?
      end
    end
  end
end
