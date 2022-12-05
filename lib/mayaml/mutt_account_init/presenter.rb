# frozen_string_literal: true

require "mainapp/component"

module Mayaml
  module MuttAccountInit
    class Presenter
      include ::Mainapp::Component
      attr_struct :logger

      def for_render(data, infrastructure)
        infrastructure = infrastructure.to_h
        {
          name: name(data),
          accounts_dir: accounts_dir(infrastructure),
          clean_name: clean_name(data)
        }
      end

      private

      def name(data)
        data[:name]
      end

      def accounts_dir(infrastructure)
        infrastructure[:accounts_dir] || "~/.mutt/accounts"
      end

      def clean_name(data)
        "#{data[:index]}_#{data[:name].gsub(/\W/, "_")}"
      end
    end
  end
end
