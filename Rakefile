require 'rubygems'

require 'bundler/setup'
require 'rake/notes/rake_task'
require 'rspec/core/rake_task'
require 'yard'

desc 'Run continuous integration test'
task :ci do
  # Run unit tests
  Rake::Task['test:unit'].invoke

  # Run integration test when not PR
  unless ENV['TRAVIS'] == 'true' && ENV['TRAVIS_SECURE_ENV_VARS'] == 'false'
    Rake::Task['test:integration'].invoke
  end

  # Run Rubocop to make sure all code comply with ruby style guid
  # Rake::Task['test:cop'].invoke if RUBY_VERSION.start_with?('2.2') == false

  # Rake::Task['coveralls:push'].invoke

  # Generate doc using 'yard'
  Rake::Task['yard'].invoke
end

desc 'Run Rubocop'
task :cop do
  exec 'rubocop apps/ snippets/'
end

RSpec::Core::RakeTask.new(:test)

namespace :test do
  desc "Run unit tests"
  RSpec::Core::RakeTask.new(:unit) do |t|
    t.pattern = 'spec/unit/**/*.rb'
  end

  desc "Run integration tests"
  RSpec::Core::RakeTask.new(:integration) do |t|
    t.pattern = 'spec/integration/**/*.rb'
  end

  desc "Run coding style tests"
  RSpec::Core::RakeTask.new(:cop) do |t|
    Rake::Task['cop'].invoke
  end

  task :all => [:unit, :integration]
end

desc "Run all tests"
task :test => 'test:all'

task :usage do
  puts "No rake task specified, use rake -T to list them"
end

YARD::Rake::YardocTask.new

task :default => [:usage]