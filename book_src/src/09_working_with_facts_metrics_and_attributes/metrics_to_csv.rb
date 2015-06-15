# encoding: UTF-8

require 'gooddata'

# Connect to GoodData platform
GoodData.with_connection do |c|
  GoodData.with_project('project_id') do |project|
    CSV.open(project.pid + "_metrics.csv", 'wb') do |csv|
    metrics = project.metrics
    metrics.peach do |metric|
        csv << [metric.title, metric.pretty_expression]
    end
    puts 'The CSV is ready!'
  end
end