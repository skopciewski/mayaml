# frozen_string_literal: true

require "mainapp/component"

module Mayaml
  module MuttAccountInit
    class Validator
      include ::Mainapp::Component
      attr_struct :logger

      def validate(data)
        %i[name index].each do |value|
          raise ArgumentError.new "Missing #{value}" if missing?(data, value)
        end
      end

      private

      def missing?(data, value)
        data[value].to_s.strip == ""
      end
    end
  end
end
