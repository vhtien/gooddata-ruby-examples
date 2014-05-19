# encoding: utf-8

require 'gooddata'

username = 'svarovsky+gem_tester@gooddata.com'
password = 'jindrisska'

# Connect to platform using credentials
puts "Connecting as #{username} ..."
GoodData.connect username, password

# Get your domain ..
domain = GoodData::Domain['gooddata-tomas-svarovsky']

# Generate random password
pass = (0...10).map { ('a'..'z').to_a[rand(26)] }.join

new_user = domain.add_user(
  :login => 'tomas.korcak42@gooddata.com',
  :password => pass,
  :first_name => 'First',
  :last_name => 'Last',
  :email => 'test@gooddata.com'
)

pp new_user

# And disconnect finally
puts 'Disconnecting ...'
GoodData.disconnect
