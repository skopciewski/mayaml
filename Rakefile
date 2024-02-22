# frozen_string_literal: true

require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
end

task default: :test

desc "Run app console"
task :console do
  # rubocop:disable all
  require_relative "lib/mayaml"
  binding.irb
  # rubocop:enable all
end
