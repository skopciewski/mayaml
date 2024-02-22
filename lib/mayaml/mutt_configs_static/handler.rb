# frozen_string_literal: true

require "mainapp/component"
require "mustache"

module Mayaml
  module MuttConfigsStatic
    class Handler
      include ::Mainapp::Component
      attr_struct :logger

      def execute(prefix_path)
        keys = %w[account_chooser.sh csk.muttrc mailcap muttrc]
        keys.map do |config_file|
          key = build_path(prefix_path, config_file)
          value = ::Mustache.render assets_file_content(config_file), prefix_path: prefix_path
          {key => value}
        end
      end

      private

      def build_path(prefix_path, config_file)
        File.join(
          prefix_path,
          config_file
        )
      end

      def assets_file_content(config_file)
        path = File.join(
          __dir__,
          "assets",
          config_file
        )
        File.read path
      end
    end
  end
end
