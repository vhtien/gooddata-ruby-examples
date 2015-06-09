# encoding: utf-8

require 'gooddata'

GoodData.with_connection('user', 'password') do |client|
  GoodData.with_project('project_pid') do |project|
    users = []
    CSV.foreach('data.csv', :headers => true, :return_headers => false) do |row|
      users << row.to_hash.symbolize_keys
    end
    domain.create_users(users)
    project.import_users(users, domain: domain)
  end
end

