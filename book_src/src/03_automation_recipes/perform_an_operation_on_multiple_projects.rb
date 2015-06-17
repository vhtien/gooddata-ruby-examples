# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |client|

  projects = [
      client.projects('project_pid_a'),
      client.projects('project_pid_b')
  ]

  results = projects.map do |project|
    reports_to_validate = project.reports
                                .select { |report| report.updated > 2.weeks.ago }
                                .select { |report| report.definitions.count > 1 }

    GoodData::Report.find_by_tag('to_be_checked', :project => project).each do |report|
      report.remove_tag('to_be_checked')
      report.save
    end

    reports_to_validate.each do |report|
      report.add_tag('to_be_checked')
      report.save
    end

    {project: project, reports_to_validate: reports_to_validate.count}
  end

  results.each do |result|
    puts "#{result[:project].pid}: there are #{result[:reports_to_validate]} reports to check"
  end

end