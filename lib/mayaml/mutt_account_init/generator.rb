# frozen_string_literal: true

require "mainapp/component"
require "mustache"

module Mayaml
  module MuttAccountInit
    class Generator
      include ::Mainapp::Component
      attr_struct :logger

      def render(data)
        ::Mustache.template_path = __dir__
        ::Mustache.render :template, data
      end
    end
  end
end
