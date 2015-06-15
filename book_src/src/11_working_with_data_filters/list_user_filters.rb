# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |c|
  GoodData.with_project('project_id') do |project|
    project.data_permissions.pmap {|f| [f.related.login, f.pretty_expression]}
  end
end
