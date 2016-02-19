# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |c|
  GoodData.with_project('project_id') do |project|
    project.reports.peach do |report|
      r.report.purge_report_of_unused_definitions!
    end
  end
end
