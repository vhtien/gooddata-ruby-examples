# encoding: utf-8

require 'gooddata'

login = 'john.doe@gooddata.com'

# Connect to platform using credentials
GoodData.with_connection do |client|
  # first select only projects where you are admin
  # which means you can read users and disable them
  projects = client.projects.pselect(&:am_i_admin?)
  projects.peach do |project|
    project.member(login).disable
  end
end
