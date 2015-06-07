# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |c|
  GoodData.with_project('project_pid') do |project|

    # You can select the dataset in several ways
    dataset = project.datasets.find {|d| d.title == 'Users'}
    dataset = project.datasets('dataset.users')
    dataset = project.datasets(345)
    # dataset.synchronize works as well
    dataset.delete_data
    
  end
end