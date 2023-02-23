# frozen_string_literal: true

require "mainapp/component"

module Mayaml
  module MuttAccountAlternates
    class Presenter
      include ::Mainapp::Component
      attr_struct :logger

      def for_render(data)
        {
          accounts: data.map(&:to_s).join(" ")
        }
      end
    end
  end
end
