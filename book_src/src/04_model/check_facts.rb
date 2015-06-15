# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |c|
  GoodData.with_project('project_pid') do |project|
    blueprint = project.blueprint
    # NEED TO BE CHECKED PROBABLY DOES NOT WORK OUT OF THE BOX
    blueprint.date_facts.count
    blueprint.date_facts.each { |df| puts df[:name] }
  end
end