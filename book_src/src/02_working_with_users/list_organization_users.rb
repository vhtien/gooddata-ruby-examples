# encoding: utf-8

require 'gooddata'

# Connect to platform using credentials
client = GoodData.connect

domain = client.domain('domain_name')
users = domain.users
pp users
