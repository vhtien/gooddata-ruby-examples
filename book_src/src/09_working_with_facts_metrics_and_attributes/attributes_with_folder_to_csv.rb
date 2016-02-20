# encoding: UTF-8

require 'gooddata'

# Connect to GoodData platform
GoodData.with_connection do |c|
  GoodData.with_project('project_id') do |project|

    folder_cache = c.get(project.md['query'] + '/dimensions')['query']['entries'].reduce({}) do |a, e|
      a[e['link']] = project.objects(e['link'])
      a
    end

    CSV.open(project.pid + "_attributes.csv", 'wb') do |csv|
      data = project.attributes.pmap do |attribute|
        [attribute.title, attribute.identifier, attribute.content['dimension'] && folder_cache[attribute.content['dimension']].title]
      end
      data.each do |m|
        csv << m
      end
      puts 'The CSV is ready!'
    end
  end
end
