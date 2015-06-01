# encoding: UTF-8

require 'gooddata'

# Project ID
PROJECT_ID = 'we1vvh4il93r0927r809i3agif50d7iz'

# Connect to GoodData platform
c = GoodData.connect('user', 'password')

GoodData.with_connection do |c|
  GoodData.with_project(PROJECT_ID) do |project|
    CSV.open(project.pid + "_metrics.csv", 'wb') do |csv|
      project.metrics.each do |metric|
        puts metric.pretty_expression
        csv << [m]
      end
    end
    puts 'The CSV is ready!'
  end
end