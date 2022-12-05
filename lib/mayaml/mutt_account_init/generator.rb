# frozen_string_literal: true

require "mainapp/component"
require "mustache"

module Mayaml
  module MuttAccountInit
    class Generator
      include ::Mainapp::Component
      attr_struct :logger, :presenter, :infrastructure

      def render(data)
        valid_data = validate_data(data)
        render_view(valid_data)
      end

      private

      def validate_data(data)
        data
      end

      def render_view(data)
        ::Mustache.template_path = __dir__
        ::Mustache.render :template, presenter.for_render(data, infrastructure)
      end
    end
  end
end
