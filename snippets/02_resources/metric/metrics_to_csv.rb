# 30 Days of Automation: GoodData Ruby SDK
# Visit http://sdk.gooddata.com/gooddata-ruby/ for Tutorials, Examples, and Support.

require 'gooddata'

# Login to the GoodData project
GoodData.connect 'expert.services@gooddata.com', 'asecretpassword'

puts "Paste the Project ID:"
id = gets.chomp

# Tell the GoodData Module what the default project is.
GoodData.project = id

CSV.open(GoodData.project+"_metrics.csv", "wb") do |csv|
  metrics = GoodData::Metric.all :full => true
  metrics.each { |metric|
  	m = metric.pretty_expression
  	puts m
    csv << [m]
  }
end

puts 'The CSV is ready!'






