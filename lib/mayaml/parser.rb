# frozen_string_literal: true

require "yaml"

module Mayaml
  class Parser
    def self.get_accounts(json_file)
      YAML.load_file json_file
    rescue Errno::ENOENT, Psych::SyntaxError
      []
    end
  end
end
