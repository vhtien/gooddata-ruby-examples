# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |c|
  GoodData.with_project('project_id') do |project|
    bp = project.blueprint
    bp.store_to_file('model.json')
  end
end

