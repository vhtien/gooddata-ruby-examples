# encoding: UTF-8

require 'gooddata'

# Connect to GoodData platform
GoodData.with_connection do |c|
  GoodData.with_project('project_id') do |project|
    metric = project.add_measure 'SELECT PERCENTILE(#"Amount",0.9)', 
     title: 'Salary Amount [90th Pct]'
    metric.save
    metric.execute
    
    metric = project.add_measure 'SELECT PERCENTILE(![fact.salary.amount],0.9)', 
     title: 'Salary Amount [90th Pct] V2' 
    metric.save
    metric.execute
    
    metric = project.add_measure 'SELECT PERCENTILE([/gdc/md/ptbedvc1841r4obgptywd2mzhbwjsfyr/obj/223],0.9)', 
     title: 'Salary Amount [90th Pct] V3' 
    metric.save
    metric.execute
    
  end
end
