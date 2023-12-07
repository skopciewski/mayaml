# frozen_string_literal: true

require "mainapp/component"

module Mayaml
  module MuttAccountInit
    class Presenter
      include ::Mainapp::Component
      attr_struct :logger

      def for_render(data)
        {
          name: name(data),
          accounts_path: accounts_path(data),
          clean_name: clean_name(data)
        }
      end

      private

      def name(data)
        data[:name]
      end

      def accounts_path(data)
        File.join(
          data[:prefix_path],
          "accounts"
        )
      end

      def clean_name(data)
        "#{data[:index]}_#{data[:name].gsub(/\W/, "_")}"
      end
    end
  end
end
