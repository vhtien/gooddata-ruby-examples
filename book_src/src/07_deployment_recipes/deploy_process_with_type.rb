# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |client|
  GoodData.with_project('project_id') do |project|
    project.deploy_process('./path/to_cloud_connect_process.rb',
      type: :ruby,
      name: 'Test ETL Process')
    end
end
