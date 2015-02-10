require 'gooddata'

GoodData.with_connection do |client|

  # Get your domain ..
  domain = client.domain('custom_domain')
  project = client.projects('project_id')

  # Let's get all users except of ourselves
  users_to_add = domain.users.reject { |u| u.login != client.user.login }

  # Let's add all as viewer
  users_to_add.each { |u| project.add_user(u, 'Viewer', domain: domain) }

end