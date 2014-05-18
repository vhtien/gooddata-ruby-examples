# encoding: utf-8

require 'gooddata'

username = 'svarovsky+gem_tester@gooddata.com'
password = 'INVALID_PASSWORD'

# Connect to platform using INVALID credentials
puts "Connecting as #{username}"
GoodData.connect username, password

# Do something which fails and handle error
begin
  # We are going to list projects, but we specified wrong credentials so this will fail.
  GoodData::Project.all
rescue Exception => e
  puts 'ERROR'
  pp e
end

GoodData.disconnect
# TODO: add code here

# And disconnect finally
puts 'Disconnecting'
GoodData.disconnect
