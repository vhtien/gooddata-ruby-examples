# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |client|
  project = GoodData.use('project_id')
  process = project.processes('6a75759f-2a76-49c8-af18-ad3bc58fc65e')
  process.execute('hello_world.rb', params: { param1: 'a', param2: 'b' })
end