# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |c|
  project = client.projects('project_id')
  puts project.reports(1234).execute
end
