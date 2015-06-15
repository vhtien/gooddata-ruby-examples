# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |c|
  GoodData.with_project('project_id') do |project|
    # First let's grab an attribute
    attribute = project.attributes('attr.region.city')
    # to set up a value we need a specific label
    # if the attribute has only one label, you can easily grab it by calling #primary_label
    label = attribute.primary_label
    # if a label has multiple labels, you can select the correct one like this
    # label = attribute.label_by_name('City name')
    filters = GoodData::UserFilterBuilder::get_filters('data.csv', { 
      :type => :filter, 
      :labels => [{:label => label}]
      })
    project.add_data_permissions(filters)
  end
end
  