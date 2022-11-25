# frozen_string_literal: true

module Mayaml
  class MailAccount
    class MailboxesValidator
      def initialize(mailboxes)
        @mailboxes = mailboxes
        errors << "Mailboxes should be array." unless right_mailboxes_type?
        errors << "Mailboxes can not be empty." unless mailboxes_exists?
        errors << "Mailboxes should all be strings." unless right_mailboxes_content?
      end

      def valid?
        errors.empty?
      end

      def errors
        @errors ||= []
      end

      private

      def right_mailboxes_type?
        @mailboxes.instance_of? Array
      end

      def mailboxes_exists?
        right_mailboxes_type? && !@mailboxes.empty?
      end

      def right_mailboxes_content?
        right_mailboxes_type? && @mailboxes.all? { |box| box.instance_of? String }
      end
    end
  end
end
