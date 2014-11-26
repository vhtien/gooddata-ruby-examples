# encoding: utf-8

require 'gooddata'

GoodData.with_connection('user', 'password') do |c|
  GoodData.with_project('project_pid') do |p|
    p.invite('joe@example.com', 'admin', 'Hey Joe, look at this.')
  end
end