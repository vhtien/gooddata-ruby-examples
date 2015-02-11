# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |client|
  project = client.project('project_id')
  process = project.deploy_process('./hello_world.rb',
                                   type: :ruby,
                                   name: "example_process")
  process.create_schedule('0 15 * * *', 'hello_world.rb', params: { param1: 'a', param2: 'b' })
end
