# frozen_string_literal: true

module Mayaml
  class MailAccount
    class TypeValidator
      VALID_TYPES = %i[imap pop3 imapssl pop3ssl].freeze

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
