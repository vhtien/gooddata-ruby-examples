require 'gooddata'

GoodData.with_connection do |c|
  GoodData.with_project('project_pid') do |project|
    puts project.title
  end
end