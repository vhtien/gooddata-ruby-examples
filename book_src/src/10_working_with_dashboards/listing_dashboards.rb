# encoding: UTF-8

require 'gooddata'

GoodData.with_connection do |c|
  GoodData.with_project('project_id') do |project|
    # List all dashboards and their names
    pp project.dashboards.map(&:title)
  end
end
