# encoding: utf-8

require 'gooddata'

user_from_login = 'john@example.com'
user_to_login = 'jane@example.com'

client_from = GoodData.connect(user_from_login, 'password', server: 'https://customer_1_domain.gooddata.com')
client_to = GoodData.connect(user_to_login, 'password', server: 'https://customer_2_domain.gooddata.com')

from_project = client_from.projects('project_pid_1')
to_project = client_to.create_project(:title => "project_title", :auth_token => "TOKEN")

export_token = from_project.export_clone(authorized_users: [user_to_login], data: true, users: false)
to_project.import_clone(export_token)