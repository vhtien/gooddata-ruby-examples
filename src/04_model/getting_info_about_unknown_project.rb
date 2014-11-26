# encoding: utf-8

require 'gooddata'

GoodData.with_connection('user', 'password') do |c|
  project = GoodData.use('project_id')
  project.info
end