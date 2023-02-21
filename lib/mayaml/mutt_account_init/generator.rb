# frozen_string_literal: true

require "mainapp/component"
require "mustache"

module Mayaml
  module MuttAccountInit
    class Generator
      include ::Mainapp::Component
      attr_struct :logger, :presenter, :accounts_dir, :validator

      def render(index, data)
        ext_data = data.merge(index: index, accounts_dir: accounts_dir)
        validate_data(ext_data)
        render_view(ext_data)
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
