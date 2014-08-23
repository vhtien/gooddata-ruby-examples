require 'gooddata'

GoodData.with_connection do |c|
  fact = project.facts('fact.commits.lines_changed')
  metric = fact.create_metric(:title => "Sum of [#{fact.identifier}]")
  metric.save
  metric.execute
end