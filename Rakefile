# encoding: UTF-8

require 'rubygems'
require 'bundler/setup'

require_relative './lib/erb_helper'

desc 'Build book'
task :build do
  Rake::Task['erb'].invoke
  system 'asciidoctor -d book book.asciidoc'
end

desc 'Run continuous integration'
task :ci do
  Rake::Task['build'].invoke
end

desc 'Clean generated stuff'
task :clean do
  ErbHelper.new.clean
end

task 'Run ERB preprocessing'
task :erb do
  ErbHelper.new.run
end

task :usage do
  puts 'No rake task specified, use rake -T to list them'
end

desc 'Run watcher for automatic building'
task :watch do
  system 'watchr script/build.rb'
end

task :default => [:usage]
