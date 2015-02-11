# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |client|
  project = client.projects('project_id')
  project.deploy_process('./path/to_cloud_connect_directory',
    name: 'Test ETL Process')
end