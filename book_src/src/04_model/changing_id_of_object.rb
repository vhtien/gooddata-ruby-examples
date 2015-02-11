# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |c|
  project = GoodData.use('project_id')

  # We find the attribute we want to change
  # Here I just pick the first one
  attribute = project.attributes.first

  # We have a look at the current value.
  # Let's say it is 'attr.users.region'
  puts attribute.identifier

  # We change the value
  attribute.identifier = 'attr.salesmen.region'
  attribute.save

  # If we refresh the value from server
  # we get a new value 'attr.salesmen.region'
  attribute.reload!
  puts attribute.identifier

end