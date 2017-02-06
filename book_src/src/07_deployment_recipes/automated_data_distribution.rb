# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |client|
  GoodData.with_project('project_id') do |project|
    ads = client.create_datawarehouse(title: 'Test ADS', auth_token: 'ADS_CREATION_TOKEN')
    output_stage = project.create_output_stage(ads)
    puts output_stage.sql_diff
    add_process = project.add.process
  end  
end