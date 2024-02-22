# frozen_string_literal: true

require "mainapp/component"

module Mayaml
  module MuttAccountCreds
    class Presenter
      include ::Mainapp::Component
      attr_struct :logger

      def for_render(data)
        %i[realname name smtp_authenticator smtp_protocol smtp_server smtp_port
          user pass].inject({}) do |result, key|
          result.merge key => send(key, data)
        end
      end

      private

      def method_missing(key, *args)
        args.dig 0, key
      end

      def respond_to_missing?(method_name, include_private = false)
        super
      end
    end
  end
end
