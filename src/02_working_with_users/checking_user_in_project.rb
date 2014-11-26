# encoding: utf-8

require 'gooddata'

GoodData.with_connection('user', 'password') do |c|
  GoodData.with_project('project_pid') do |project|
    project.member?(' jane.doe @example.com ')
  end
end