# encoding: utf-8

require 'gooddata'

# Connect to platform using credentials
GoodData.with_connection do |c|
  GoodData.with_project('project_pid') do |project|
    user = project.member('john@example.com')
    user.disable
    # You can reenable the user again
    user.enable
  end
end
