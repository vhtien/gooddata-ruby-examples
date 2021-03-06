# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |c|
    blueprint = GoodData::Model::ProjectBlueprint.build("my_blueprint") do |p|
      p.add_date_dimension('created_on')
  
      p.add_dataset('stuff') do |d|
        d.add_date('created_on', dataset: 'created_on')
        d.add_fact('some_number')
      end
end

project = c.create_project_from_blueprint(blueprint, auth_token: 'token')

# After the project is created (might take a while) you can start using it
project.title # => "my_blueprint"
project.datasets.count # => 2