# encoding: utf-8

require 'gooddata'

client = GoodData.connect
domain = client.domain 'organization_name'
u = domain.find_user_by_login('john@gooddata.com')
u.sso_provider = 'a_provider'
domain.update_user(u)
