# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |client|
  GoodData.with_project('project_id') do |project|
    process = project.deploy_process('./path/to_cloud_connect_directory', name: 'Test ETL Process')
    process.create_schedule('0 15 * * *', 'graph/my_graph.grf', params: { param1: 'a', param2: 'b' })
  end  
end