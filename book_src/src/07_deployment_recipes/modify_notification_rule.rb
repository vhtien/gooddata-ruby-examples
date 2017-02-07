# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |client|
  GoodData.with_project('project_id') do |project|
    project.processes.each do |process|
      process.notification_rules.each do |rule|
        rule.subject = 'Changed subject'
        rule.save
        rule.delete
      end
    end
  end
end