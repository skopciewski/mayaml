# frozen_string_literal: true

# Copyright (C) 2017 Szymon Kopciewski
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
    class TypeValidator
      VALID_TYPES = [:imap, :pop3, :imapssl, :pop3ssl].freeze

      def initialize(type)
        @type = convert_type(type)
        errors << "Mail account type is invalid. Allowed types: #{valid_types}." unless valid_type?
      end

      def valid?
        errors.empty?
      end

      def errors
        @errors ||= []
      end

      private

      def convert_type(type)
        type.to_sym if type.respond_to? :to_sym
      end

      def valid_type?
        VALID_TYPES.include? @type
      end

      def valid_types
        VALID_TYPES.join(", ")
      end
    end
  end
end
