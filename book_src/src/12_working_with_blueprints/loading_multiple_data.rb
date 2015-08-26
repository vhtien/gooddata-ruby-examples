# encoding: utf-8

require 'gooddata'
require 'csv'

USERNAME = 'YOUR_USERNAME'
PASSWORD = 'YOUR_PASSWORD'
TOKEN = 'YOUR_TOKEN'

GoodData.with_connection(USERNAME, PASSWORD) do |client|
  # Create LDM blueprint
  blueprint = GoodData::Model::ProjectBlueprint.from_json('data/hr_manifest.json')

  # Create new project (datamart)
  project = GoodData::Project.create_from_blueprint(blueprint, auth_token: TOKEN)
  puts "Created project #{project.pid}"

  data = [
    {
      data: 'data/hr_departments.csv',
      dataset: 'dataset.department',
    },
    {
      data: 'data/hr_employees.csv',
      dataset: 'dataset.employee'
    },
    {
      data: 'data/hr_salaries.csv',
      dataset: 'dataset.salary',
      options: {:mode => 'INCREMENTAL'}
    }
  ]
  res = project.upload_multiple(data, blueprint)

  puts JSON.pretty_generate(res)

  puts 'Done!'
end
