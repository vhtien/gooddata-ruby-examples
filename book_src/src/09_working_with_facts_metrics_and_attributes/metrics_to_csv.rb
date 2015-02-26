# encoding: UTF-8

require 'gooddata'

# Connect to GoodData platform
client = GoodData.connect('user', 'password')
project = client.projects(PROJECT_ID)

CSV.open(project.pid + "_metrics.csv", 'wb') do |csv|
    metrics = project.metrics
    metrics.peach do |metric|
        csv << [metric.title, metric.pretty_expression]
    end
end

puts 'The CSV is ready!'
