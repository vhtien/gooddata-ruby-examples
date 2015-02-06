# encoding: UTF-8

# require 'rake/notes/rake_task'
# require 'rspec/core/rake_task'

desc 'Generates the book'
task :book do
  system 'cd lib && rake book'
end

desc 'Build book'
task :build do
  system 'cd lib && rake build'
end

desc 'Run continuous integration'
task :ci do
  system 'cd lib && rake ci'
end

desc 'Run all tests'
task :test => 'test:all'

task :usage do
  puts 'No rake task specified, use rake -T to list them'
end

task :default => [:usage]