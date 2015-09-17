# encoding: utf-8

require 'gooddata'
require 'active_support/all'

GoodData.with_connection('user', 'password') do |client|
  domain = client.domain('domain-name')
  users = []
  CSV.foreach('data.csv', :headers => true, :return_headers => false) do |row|
    users << row.to_hash.symbolize_keys.slice(:pid, :login, :role)
  end
  users.group_by {|u| u[:pid]}.map do |project_id, users|
    GoodData.with_project(project_id) do |project|
      project.import_users(users, domain: domain, whitelists: ["svarovsky@gooddata.com"])
    end
  end
end
