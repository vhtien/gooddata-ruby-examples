require 'gooddata'

GoodData.with_connection do |c|
  attribute = project.attributes('attr.devs.dev_id')
  metric = attribute.create_metric(:title => "Count of [#{attribute.identifier}]")
  metric.save
  metric.execute
end