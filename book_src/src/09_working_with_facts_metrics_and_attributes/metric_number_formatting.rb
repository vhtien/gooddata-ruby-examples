# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |c|
  GoodData.with_project('project_id') do |project|
    project.metrics.pmap do |metric|
      metric.content['format'] = metric.content['format'].gsub('$', '€')
      metric.save
    end
  end
end