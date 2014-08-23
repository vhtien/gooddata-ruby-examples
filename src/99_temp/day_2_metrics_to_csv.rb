# encoding: UTF-8

require 'gooddata'

PROJECT_ID = 'we1vvh4il93r0927r809i3agif50d7iz'


GoodData.with_connection do |c|
    puts 'Paste the Project ID:'
    id = gets.chomp

    project = c.project(id)

    CSV.open(id + "_metrics.csv", 'wb') do |csv|
        metrics = project.metrics
        metrics.each do |metric|
            m = metric.pretty_expression
            puts m
            csv << [m]
        end
    end

    puts 'The CSV is ready!'
end