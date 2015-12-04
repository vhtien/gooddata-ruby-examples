# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |client|
  GoodData.with_project('project_id') do |project|
    blueprint = project.blueprint

    blueprint.swap_date_dimension!('committed_on', 'signed_on')

    # Update the project with the new blueprint
    project.update_from_blueprint(blueprint)
  end
end
