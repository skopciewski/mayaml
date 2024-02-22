# frozen_string_literal: true

require "mainapp/component"

module Mayaml
  module MuttConfigsInit
    class Handler
      include ::Mainapp::Component
      attr_struct :logger, :mutt_account_init_generator, :mutt_account_alternates_generator

      def execute(data, prefix_path)
        key = build_path(prefix_path)
        view = compute_config data, prefix_path
        [{key => view}]
      end

      private

      def build_path(prefix_path)
        File.join(
          prefix_path,
          "init.muttrc"
        )
      end

      def compute_config(data, prefix_path)
        view = "vim: filetype=muttrc\n\n"
        view += data.map.with_index do |account_data, index|
          mutt_account_init_generator.render index, prefix_path, account_data
        end.join("\n")
        view += "\n"
        view += mutt_account_alternates_generator.render data
        view
      end
    end
  end
end
