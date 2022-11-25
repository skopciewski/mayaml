# frozen_string_literal: true

module Mayaml
  class MailAccount
    class SmtpProtocolValidator
      VALID_TYPES = %i[smtp smtps].freeze

      def initialize(type)
        @type = convert_type(type)
        errors << "Mail account smtp_protocol is invalid. Allowed: #{types}." unless valid_type?
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

      def types
        VALID_TYPES.join(", ")
      end
    end
  end
end
