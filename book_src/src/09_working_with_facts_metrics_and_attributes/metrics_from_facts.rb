# encoding: UTF-8

require 'gooddata'

# Connect to GoodData platform
client = GoodData.connect('user', 'password')
project = client.project(PROJECT_ID)

fact = project.facts('fact.commits.lines_changed')
metric = fact.create_metric(:title => "Sum of [#{fact.identifier}]")
metric.save
res = metric.execute

puts res
