# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |c|
  project = GoodData.use('project_id')
  blueprint = project.blueprint
  dds = blueprint.date_dimensions
  puts "You have #{dds.count} date dimensions in your project"
end