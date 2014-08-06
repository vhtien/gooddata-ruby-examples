# encoding: utf-8

require 'gooddata'

username = 'svarovsky+gem_tester@gooddata.com'
password = 'jindrisska'

GoodData.logging_on

# Connect to platform using credentials
puts "Connecting as #{username} ..."
GoodData.connect username, password

# Do some interaction with GoodData Platfrom and observe logger output in CLI
GoodData::Project.all

# And disconnect finally
puts 'Disconnecting ...'
GoodData.disconnect
