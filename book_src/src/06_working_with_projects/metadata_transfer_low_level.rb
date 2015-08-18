# encoding: UTF-8

require 'gooddata'

GoodData.with_connection do |c|
  target_project = c.projects('target_project_id')

  # Lets log into project you would like to transfer from  
  GoodData.with_project('master_project_id') do |master_project|
    # find objects you would like to transfer
    # here we transfer all reports containing word "sales" in the title
    reports = master_project.reports.select { |r| r.title =~ /title/ }
    begin
      token = master_project.objects_export(reports)
    rescue ObjectsExportError
      puts "Export failed"
    end
    begin
      target_project.objects_import(token)
    rescue ObjectsImportError
      puts "Import failed"
    end    
  end
end
