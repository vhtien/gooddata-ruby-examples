# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |c|
  GoodData.with_project('project_pid') do |project|
    project.delete_all_data(force: true)
  end
end