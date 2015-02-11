# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |c|
  original_project = c.projects('project_id_1')
  new_project = c.projects('project_id_2')

  # We assume that reports have unique name inside a project
  orig_reports = GoodData::Report.find_by_tag('to_check', client: c, project: original_project).sort_by(&:title)
  new_reports = GoodData::Report.find_by_tag('to_check', client: c, project: new_project).sort_by(&:title)

  results = orig_reports.zip(new_reports).pmap do |reports|
    # compute both reports and add the report at the end for being able to print a report later
    reports.map(&:execute) + [reports.last]
  end

  results.map do |res|
    orig_result, new_result, new_report = res
    puts "#{new_report.title}, #{orig_result == new_result}"
  end
end