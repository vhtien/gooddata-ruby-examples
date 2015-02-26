# encoding: UTF-8

require 'gooddata'

# Connect to GoodData platform
client = GoodData.connect('user', 'password')
project = client.projects(PROJECT_ID)

attribute = project.attributes('attr.devs.dev_id')
metric = attribute.create_metric(:title => "Count of [#{attribute.identifier}]")
metric.save
metric.execute
