# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |c|
  project = GoodData.use('project_id')
  blueprint = project.blueprint
  count = blueprint.datasets.first.count(project)
  puts "Number of lines in a dataset is #{count}"
end
