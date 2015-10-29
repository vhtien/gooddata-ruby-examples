# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |c|
  GoodData.with_project('project_id') do |project|
    report = project.reports('report_identifier')
    File.open('export.csv', 'wb') { |f| f.write(report.export(:csv)) }
  end
end
