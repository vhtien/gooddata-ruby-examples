# encoding: UTF-8

require 'rubygems'
require 'bundler/setup'

desc 'Run continuous integration'
task :ci do
  puts 'TODO: Implement continuous integration'
end

task :usage do
  puts "No rake task specified, use rake -T to list them"
end

desc 'Run watcher for automatic building'
task :watch do
  system "watchr script/build.rb"
end


task :default => [:usage]
