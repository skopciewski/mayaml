# frozen_string_literal: true

# Copyright (C) 2016, 2017 Szymon Kopciewski
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
    class RequiredAttributesValidator
      attr_reader :errors

      def initialize(mail_account)
        @errors = []
        @mail_account = mail_account
        check_mail_account_attrs
      end

      def valid?
        @errors.empty?
      end

      private

      def check_mail_account_attrs
        check_missing_name
        check_missing_realname
        check_missing_type
        check_missing_server
        check_missing_user
        check_missing_pass
        check_missing_smtp_protocol
        check_missing_smtp_port
        check_missing_smtp_authenticator
        check_missing_smtp_server
      end

      def check_missing_name
        @errors << "Missing name attribute." if @mail_account.name.nil?
      end

      def check_missing_realname
        @errors << "Missing realname attribute." if @mail_account.realname.nil?
      end

      def check_missing_type
        @errors << "Missing type attribute." if @mail_account.type.nil?
      end

      def check_missing_server
        @errors << "Missing server attribute." if @mail_account.server.nil?
      end

      def check_missing_user
        @errors << "Missing user attribute." if @mail_account.user.nil?
      end

      def check_missing_pass
        @errors << "Missing pass attribute." if @mail_account.pass.nil?
      end

      def check_missing_smtp_protocol
        @errors << "Missing smtp_protocol attribute." if @mail_account.smtp_protocol.nil?
      end

      def check_missing_smtp_port
        @errors << "Missing smtp_port attribute." if @mail_account.smtp_port.nil?
      end

      def check_missing_smtp_authenticator
        @errors << "Missing smtp_authenticator attribute." if @mail_account.smtp_authenticator.nil?
      end

      def check_missing_smtp_server
        @errors << "Missing smtp_server attribute." if @mail_account.smtp_server.nil?
      end
    end
  end
end
