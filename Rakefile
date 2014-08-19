# encoding: UTF-8

require 'rubygems'
require 'bundler/setup'

desc 'Build book'
task :build do
  system 'asciidoctor -d book book.asciidoc'
end

desc 'Run continuous integration'
task :ci do
  Rake::Task['build'].invoke
end

task :usage do
  puts 'No rake task specified, use rake -T to list them'
end

desc 'Run watcher for automatic building'
task :watch do
  system 'watchr script/build.rb'
end

task :default => [:usage]
