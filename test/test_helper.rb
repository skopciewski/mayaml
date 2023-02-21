# frozen_string_literal: true

require "simplecov"
SimpleCov.start do
  add_filter "test"
end

require "minitest/autorun"
require "minitest/reporters"
require "mayaml"

reporter_options = {color: true}
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]

module TestHelper
  TESTS_DIR = __dir__
  SUPPORT_DIR = File.join TESTS_DIR, "support"

  def base
    Mayaml::Base
  end

  def account_data(**params)
    {
      name: "name1",
      realname: "real1",
      smtp_protocol: "smtps",
      smtp_server: "smtp.test.com",
      smtp_port: 687,
      smtp_authenticator: "login",
      user: "u1",
      pass: "p1"
    }.merge params
  end
end
