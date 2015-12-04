# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |client|
  GoodData.with_project('project_id') do |project|
    blueprint = project.blueprint

    blueprint.swap_date_dimension!('committed_on', 'signed_on')

    project.update_from_blueprint

  end
end
