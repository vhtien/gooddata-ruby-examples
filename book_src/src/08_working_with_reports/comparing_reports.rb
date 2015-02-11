# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |client|
  original_project = c.projects('project_id_1')
  new_project = c.projects('project_id_2')

  orig_report = GoodData::Report.find_first_by_title('Sum of Revenue', client: c, project: original_project)
  new_report = GoodData::Report.find_first_by_title('Sum of Revenue', client: c, project: new_project)

  orig_result = orig_report.execute
  new_result = new_report.execute

  puts orig_result == new_result
end