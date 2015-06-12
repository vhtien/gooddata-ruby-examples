# encoding: UTF-8

require 'gooddata'

GoodData.with_connection do |c|
  GoodData.with_project('we1vvh4il93r0927r809i3agif50d7iz') do |project|
    # List all dashboards
    pp project.dashboards
  end
end