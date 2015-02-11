# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |client|
  project = GoodData.use('project_id')
  project.processes.first.schedules.first.execute
end
