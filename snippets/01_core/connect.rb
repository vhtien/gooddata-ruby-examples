# encoding: utf-8

require 'gooddata'

username = 'svarovsky+gem_tester@gooddata.com'
password = 'jindrisska'

# Connect to platform using credentials
puts "Connecting as #{username}"
GoodData.connect username, password

GoodData.disconnect
# TODO: add code here

# And disconnect finally
puts 'Disconnecting'
GoodData.disconnect
