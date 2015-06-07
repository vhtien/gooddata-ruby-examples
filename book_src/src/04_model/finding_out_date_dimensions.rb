# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |c|
  GoodData.with_project('project_pid') do |project|
    blueprint = project.blueprint
    dds = blueprint.date_dimensions
    puts "You have #{dds.count} date dimensions in your project"
  end
end