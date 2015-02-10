# encoding: utf-8

require 'gooddata'

# Connect to platform using credentials
GoodData.with_connection do |c|
  project = c.projects(PROJECT_PID)

  keepers = ['john@example.com', c.user.login]

  # We collect all users and remove those from the keepers array
  users_to_disable = project.users.reject { |u| keepers.include?(u.login) }

  # disable all users
  users_to_disable.pmap { |u| u.disable }
end