# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |client|
  project = GoodData.use('project_id')
  process = project.processes.find { |p| p.name == 'hello_world' }
  process.execute('hello_world.rb', params: { param1: 'a', param2: 'b' })
end