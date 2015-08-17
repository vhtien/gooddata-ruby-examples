# encoding: utf-8

require 'gooddata'

# fill this in
VARIABLE_IDENTIFIER = 'variable_identifier'
PROJECT_ID = 'project_id'

GoodData.with_connection do |c|
  GoodData.with_project(PROJECT_ID) do |project|
    var = project.variables(VARIABLE_IDENTIFIER)
    var.values.pmap do |var|
      owner = var.related.class == GoodData::Project ? "[PROJECT DEFAULT]" : var.related.login rescue nil
      [owner, var.pretty_expression]
    end
  end
end
