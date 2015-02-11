# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |c|
  project = GoodData.use('project_id')
  dataset = project.datasets.find {|d| d.title == 'Users'}
  dataset.delete_data # dataset.synchronize works as well
end
