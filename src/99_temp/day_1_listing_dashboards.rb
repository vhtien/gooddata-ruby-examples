require 'gooddata'

GoodData.with_connection do |c|
  # List all dashboards
  dashboards = project.dashboards
  pp dashboards
end