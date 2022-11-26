# frozen_string_literal: true

require "mayaml/mail_account"
require "mayaml/mail_account/error"
require "mayaml/mail_account/required_attributes_validator"
require "mayaml/mail_account/type_validator"
require "mayaml/mail_account/port_validator"
require "mayaml/mail_account/mailboxes_validator"
require "mayaml/mail_account/default_flag_validator"
require "mayaml/mail_account/smtp_protocol_validator"

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

      def default(flag)
        if flag.nil? || flag == ""
          @account.set_default_flag
        else
          valid_attribute DefaultFlagValidator, WrongDefaultFlag, flag
          @account.default = (["true", true].include? flag)
        end
      end

      def realname(realname)
        @account.realname = realname
      end

      def type(str)
        valid_attribute TypeValidator, WrongAccountType, str
        @account.type = str.to_sym
      end

      def server(str)
        @account.server = str
      end

      def port(nr)
        valid_attribute PortValidator, WrongAccountPort, nr
        @account.port = nr.to_i
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
          valid_attribute MailboxesValidator, WrongAccountMailboxes, arr
          @account.mailboxes = arr
        end
      end

      def smtp_protocol(str)
        valid_attribute SmtpProtocolValidator, WrongAccountSmtpProtocol, str
        @account.smtp_protocol = str.to_sym
      end

      def smtp_port(nr)
        valid_attribute PortValidator, WrongAccountSmtpPort, nr
        @account.smtp_port = nr.to_i
      end

      def smtp_authenticator(str)
        @account.smtp_authenticator = str
      end

      def smtp_server(str)
        @account.smtp_server = str
      end

      def account
        obj = valid_account
        @account = ::Mayaml::MailAccount.new
        obj
      end

      private

      def valid_account
        validator = RequiredAttributesValidator.new @account
        raise MissingAttributes, validator.errors.join(" ") unless validator.valid?
        @account.dup
      end

      def valid_attribute(validator_class, error_class, attribute)
        validator = validator_class.new attribute
        raise error_class, validator.errors.join(" ") unless validator.valid?
      end
    end
  end
end
