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
require "mayaml/mail_account/error"
require "mayaml/mail_account/required_attributes_validator"
require "mayaml/mail_account/type_validator"
require "mayaml/mail_account/port_validator"
require "mayaml/mail_account/mailboxes_validator"

module Mayaml
  class MailAccount
    class Builder
      def self.build
        builder = new
        yield(builder)
        builder.account
      end

      def initialize
        @account = ::Mayaml::MailAccount.new
      end

      def name(name)
        @account.name = name
      end

      def type(str)
        if str.nil? || str == ""
          @account.set_default_type
        else
          validator = TypeValidator.new str
          unless validator.valid?
            raise WrongAccountType, validator.errors.join(" ")
          end
          @account.type = str.to_sym
        end
      end

      def server(str)
        @account.server = str
      end

      def port(nr)
        if nr.nil? || nr == ""
          @account.set_default_port
        else
          validator = PortValidator.new nr
          unless validator.valid?
            raise WrongAccountPort, validator.errors.join(" ")
          end
          @account.port = nr.to_i
        end
      end

      def user(str)
        @account.user = str
      end

      def pass(str)
        @account.pass = str
      end

      def mailboxes(arr)
        if arr.nil? || arr.empty?
          @account.set_default_mailboxes
        else
          validator = MailboxesValidator.new arr
          unless validator.valid?
            raise WrongAccountMailboxes, validator.errors.join(" ")
          end
          @account.mailboxes = arr
        end
      end

      def account
        obj = valid_account
        @account = ::Mayaml::MailAccount.new
        obj
      end

      private

      def valid_account
        validator = RequiredAttributesValidator.new @account
        unless validator.valid?
          raise MissingAttributes, validator.errors.join(" ")
        end
        @account.dup
      end
    end
  end
end
