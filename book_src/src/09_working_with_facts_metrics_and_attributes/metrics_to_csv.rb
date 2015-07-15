# encoding: UTF-8

require 'gooddata'

# Connect to GoodData platform
GoodData.with_connection do |c|
  GoodData.with_project('project_id') do |project|
    CSV.open(project.pid + "_metrics.csv", 'wb') do |csv|
      data = project.metrics.pmap do |metric|
        [metric.title, metric.pretty_expression]
      end
      data.each do |m|
        csv << m
      end
      puts 'The CSV is ready!'
    end
  end
end
