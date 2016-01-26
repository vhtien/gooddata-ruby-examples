# encoding: UTF-8

require 'gooddata'

# Connect to GoodData platform
GoodData.with_connection do |c|
  GoodData.with_project('project_id') do |project|
    CSV.open(project.pid + "_attributes.csv", 'wb') do |csv|
      data = project.attributes.pmap do |attribute|
        [attribute.title, attribute.identifier]
      end
      data.each do |m|
        csv << m
      end
      puts 'The CSV is ready!'
    end
  end
end
