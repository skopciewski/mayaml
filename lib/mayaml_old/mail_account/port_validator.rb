# frozen_string_literal: true

module Mayaml
  class MailAccount
    class PortValidator
      def initialize(port)
        port = conver_port(port)
        errors << "Mail account port is invalid." if port.zero?
        errors << "Mail account port could not be negative." if port.negative?
      end

      def valid?
        errors.empty?
      end

      def errors
        @errors ||= []
      end

      private

      def conver_port(port)
        port.respond_to?(:to_i) ? port.to_i : 0
      end
    end
  end
end
