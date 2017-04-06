# encoding: utf-8
# frozen_string_literal: true

# Copyright (C) 2017 Szymon Kopciewski
#
# This file is part of Mayaml.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
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
