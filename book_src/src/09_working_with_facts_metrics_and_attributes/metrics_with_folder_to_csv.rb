# encoding: UTF-8

require 'gooddata'

# Connect to GoodData platform
GoodData.with_connection do |c|
  GoodData.with_project('project_id') do |project|

    folder_cache = c.get(project.md['query'] + '/folders?type=metric')['query']['entries'].reduce({}) do |a, e|
      a[e['link']] = project.objects(e['link'])
      a
    end

    CSV.open(project.pid + "_metrics.csv", 'wb') do |csv|
      data = project.metrics.map do |metric|
        folder = metric.content.key?('folders') && metric.content['folders'].is_a?(Enumerable) && metric.content['folders'].first
        [metric.title, metric.identifier, folder_cache[folder] && folder_cache[folder].title]
      end
      data.each do |m|
        csv << m
      end
      puts 'The CSV is ready!'
    end
  end
end
