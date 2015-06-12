# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |client|
  GoodData.with_project('project_id') do |project|
    process = project.deploy_process('./hello_world.rb',
      type: :ruby,
      name: "example_process")
    process.execute('hello_world.rb', params: { param1: 'a', param2: 'b' })
  end
end