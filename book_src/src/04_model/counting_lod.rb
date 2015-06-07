# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |c|
  GoodData.with_project('project_pid') do |project|
    blueprint = project.blueprint
    blueprint.datasets.each do |dataset|
      count = dataset.count(project)
      puts "Number of record in a dataset #{dataset.title} is #{count}"
    end
  end
end
