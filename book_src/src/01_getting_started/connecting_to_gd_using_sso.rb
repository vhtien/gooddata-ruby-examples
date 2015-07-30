# encoding: utf-8

require 'gooddata'
require 'pp'

client = GoodData.connect_sso('tomas.korcak@gooddata.com', 'gooddata.tomas.korcak')

pp client.user.json