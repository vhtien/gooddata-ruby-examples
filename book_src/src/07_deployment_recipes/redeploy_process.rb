# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |client|
  GoodData.with_project('project_id') do |project|
    process = project.processes('process_id')
    process.deploy('path_to_your_process')
  end
end