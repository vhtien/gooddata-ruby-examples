# encoding: UTF-8

require 'gooddata'

PROJECT_ID = 'we1vvh4il93r0927r809i3agif50d7iz'

GoodData.with_connection do |c|
    project = c.project(PROJECT_ID)

    attribute = project.attributes('attr.devs.dev_id')
    metric = attribute.create_metric(:title => "Count of [#{attribute.identifier}]")
    metric.save
    metric.execute
end