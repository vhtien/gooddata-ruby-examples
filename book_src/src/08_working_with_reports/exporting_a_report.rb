# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |c|
  GoodData.with_project('project_id') do |project|
    result = project.reports.export(:csv)
    puts result
  end
end
