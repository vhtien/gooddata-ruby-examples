# encoding: utf-8

require 'gooddata'

GoodData.with_connection('user', 'password') do |client|

  domain = client.domain('domain-name')
  users = []
  CSV.foreach('data.csv', :headers => true, :return_headers => false) do |row|
    users << row.to_hash.symbolize_keys
  end

  domain.create_users(users)
end