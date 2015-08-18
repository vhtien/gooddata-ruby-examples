# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |client|
    results = client.projects # take all projects
                    .pmapcat(&:schedules) # take all their schedules (execute in parallel since this goes to API)
                    .select { |s| s.name == 'user_filters_schedule' } # filter on those that have particular name
                    .pmapcat { |s| s.executions.to_a } # take all their executions (execute in parallel since this goes to API)
                    .select(&:error?) # select only those that failed
                    .select { |e| e.log =~ /unsynchronized/ } # select those that contain particular message in log
    pp results.map(&:started).sort.uniq
end
