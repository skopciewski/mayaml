# frozen_string_literal: true

require "mainapp/component"
require "mustache"

module Mayaml
  module MuttAccountInit
    class Generator
      include ::Mainapp::Component
      attr_struct :logger, :presenter, :accounts_dir, :validator

      def render(data)
        validate_data(data)
        render_view(data)
      end

      private

      def validate_data(data)
        validator.validate data
      end

      def render_view(data)
        ext_data = data.merge(accounts_dir: accounts_dir)
        ::Mustache.template_path = __dir__
        ::Mustache.render :template, presenter.for_render(ext_data)
      end
    end
  end
end
