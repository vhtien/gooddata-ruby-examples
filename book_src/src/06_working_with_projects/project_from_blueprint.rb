# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |c|

  blueprint = GoodData::Model::ProjectBuilder.create("my_bp") do |p|
    p.add_date_dimension("created_on")
    p.add_dataset("stuff") do |d|
      d.add_date("created_on")
      d.add_fact("some_number")
    end
  end

  c.create_project_from_blueprint(blueprint, auth_token: TOKEN)
end
