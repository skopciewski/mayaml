# frozen_string_literal: true

require "mainapp/component"

module Mayaml
  module MuttConfigsDefaultAccount
    class Handler
      include ::Mainapp::Component
      attr_struct :logger

      def execute(data, prefix_path)
        account_data = default_account(data) || first_account(data)
        return [] unless account_data
        src = link_path(prefix_path)
        dest = build_path(prefix_path, account_data)
        [{src => dest}]
      end

      private

      def default_account(data)
        data.find { |account_data| account_data[:default] == true }
      end

      def first_account(data)
        data.first
      end

      def link_path(prefix_path)
        File.join(
          prefix_path,
          "accounts",
          "current_acc"
        )
      end

      def build_path(prefix_path, acc_data)
        File.join(
          prefix_path,
          "accounts",
          acc_data[:name]
        )
      end
    end
  end
end
