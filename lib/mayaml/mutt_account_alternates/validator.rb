# frozen_string_literal: true

require "mainapp/component"

module Mayaml
  module MuttAccountAlternates
    class Validator
      include ::Mainapp::Component
      attr_struct :logger

      def validate(data)
        raise ArgumentError.new "Missing accounts value" if data.nil?
        raise ArgumentError.new "Invalid accounts value" unless data.is_a? Array
        raise ArgumentError.new "Empty accounts value" if data.empty?
      end
    end
  end
end
