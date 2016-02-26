# encoding: UTF-8

require 'gooddata'

# Connect to GoodData platform
GoodData.with_connection do |c|
  GoodData.with_project('project_id') do |project|

    # Let's find the city attribute - here we assume identifer atttribute.cities.city
    city_attribute = project.attributes('atttribute.cities.city')

    # Let's find the continent label - here we assume identifer label.cities.continent.name
    continent_label = project.labels('label.cities.continent.name')
    filter_values = ['Europe', 'Africa'].map { |val| "[#{continent_label.find_value_uri(val)}]" }.join(', ')

    m = project.create_metric("SELECT COUNT([#{city_attribute.uri}]) WHERE #{continent_label.uri} IN #{filter_values}", extended_notation: false)
    puts m.execute
  end
end
