# frozen_string_literal: true

require "mainapp/component"

module Mayaml
  module MuttConfigsAccounts
    class Handler
      include ::Mainapp::Component
      attr_struct :logger, :mutt_account_creds_generator, :default_accounts_dir

      def execute(data, prefix_path)
        data.map do |account_data|
          key = build_path(prefix_path, account_data)
          view = mutt_account_creds_generator.render account_data
          {key => view}
        end
      end

      private

      def build_path(prefix_path, acc_data)
        File.join(
          prefix_path,
          default_accounts_dir,
          acc_data[:name]
        )
      end
    end
  end
end
