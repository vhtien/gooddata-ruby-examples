# encoding: UTF-8

require 'gooddata'

GoodData.with_connection do |c|
  target_project_1 = c.projects('target_project_id_1')
  target_project_2 = c.projects('target_project_id_2')

  # Lets log into project you would like to transfer from  
  GoodData.with_project('master_project_id') do |master_project|
    # find objects you would like to transfer
    # here we transfer all reports containing word "sales" in the title
    reports = master_project.reports.select { |r| r.title =~ /title/ }
    result = master_project.transfer_objects(reports, project: [target_project_1, target_project_2])
    
    # If you provided an array of projects the method will not throw an exception on failed
    # imports. It returns an array of results an you have to investigate to know what is up.
    # The shape of results is in shape
    # {
    #   project: target_project,
    #   result: true
    # }
    puts "#{result.select {|r| r[:result] }.count} projects succeeded"
    puts "#{result.reject {|r| r[:result] }.count} projects failed"
  end
end
