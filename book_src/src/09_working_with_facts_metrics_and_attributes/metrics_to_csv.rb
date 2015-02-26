# encoding: UTF-8

require 'gooddata'

# Connect to GoodData platform
client = GoodData.connect('user', 'password')
project = client.project(PROJECT_ID)

CSV.open(project.pid + "_metrics.csv", 'wb') do |csv|
    metrics = project.metrics
    metrics.each do |metric|
        m = metric.pretty_expression
        puts m
        csv << [m]
    end
end

puts 'The CSV is ready!'
