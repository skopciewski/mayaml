# frozen_string_literal: true

module Mayaml
  class MailAccount
    class DefaultFlagValidator
      def initialize(flag)
        @flag = flag
        errors << "Flag need to be 'true' or 'false'" unless valid_flag?
      end

      def valid?
        errors.empty?
      end

      def errors
        @errors ||= []
      end

      private

      def valid_flag?
        [true, false, "true", "false"].include? @flag
      end
    end
  end
end
