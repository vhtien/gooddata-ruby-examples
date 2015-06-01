# encoding: utf-8

require 'gooddata'

# Connect to platform using credentials
GoodData.with_connection do |c|
  GoodData.with_project('project_pid') do |project|
    # We collect all users minus current user
    # so we do not disable ourselves from the project
    users_to_disable = project.users.reject { |u| u.login == c.user.login }
    # disable all users
    users_to_disable.pmap {|u| u.disable}
  end
end
