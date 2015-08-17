# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |client|
  GoodData.with_project('project_id') do |project|
    results = project.schedules
                     .select { |s| s.name == 'user_filters_schedule' }
                     .pmapcat { |s| s.executions.to_a }
                     .select(&:error?)
    pp results.map(&:started).sort.uniq
  end
end
