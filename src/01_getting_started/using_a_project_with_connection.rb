require 'gooddata'

GoodData.with_connection do |c|
  project = GoodData.use('project_pid')
  puts project.title
end
