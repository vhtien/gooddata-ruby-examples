# encoding: utf-8

require 'gooddata'

GoodData.with_connection('user', 'password') do |client|
  GoodData.with_project('project_pid') do |project|
    pp project.users
    # You might want to see just name and login
    pp project.users.map {|u| [u.login, u.name]}
  end
end