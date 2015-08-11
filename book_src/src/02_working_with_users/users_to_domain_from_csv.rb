# encoding: utf-8

require 'gooddata'
require 'activesupport/all'

client = GoodData.connect

domain = client.domain('domain-name')
users = []
CSV.foreach('data.csv', :headers => true, :return_headers => false) do |row|
  users << row.to_hash.symbolize_keys
end

domain.create_users(users)
