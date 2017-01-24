# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |client|
  GoodData.with_project('project_id') do |project|
    process = project.deploy_process('./path/to_cloud_connect_directory', name: 'Test ETL Process')

    process.create_notification_rule(
      email: 'email you need to get the info',
      subject: 'Get info from project ${params.PROJECT}',
      body: 'This is a log for process ${params.PROCESS_NAME} [${params.PROCESS_ID}]: ${params.LOG}',
      events: GoodData::Subscription::PROCESS_FAILED_EVENT
    )
  end  
end