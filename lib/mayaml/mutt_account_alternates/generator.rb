# frozen_string_literal: true

require "mainapp/component"
require "mustache"

module Mayaml
  module MuttAccountAlternates
    class Generator
      include ::Mainapp::Component
      attr_struct :logger, :presenter, :validator

      def render(data)
        validate_data(data)
        render_view(data)
      end

      private

      def validate_data(data)
        validator.validate data
      end

      def render_view(data)
        ::Mustache.template_path = __dir__
        ::Mustache.render :template, presenter.for_render(data)
      end
    end
  end
end
