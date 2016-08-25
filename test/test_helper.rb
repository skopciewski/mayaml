# $LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "minitest/autorun"
require "minitest/reporters"
require "codeclimate-test-reporter"

CodeClimate::TestReporter.start

reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]

module TestHelper
  TESTS_DIR = File.expand_path(File.dirname(__FILE__))
  SUPPORT_DIR = File.join TESTS_DIR, "support"
end
