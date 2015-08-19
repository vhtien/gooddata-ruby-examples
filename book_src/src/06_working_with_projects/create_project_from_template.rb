# encoding: utf-8

require 'gooddata'

client = GoodData.connect
project = client.create_project(title: 'New project',
                                template: '/projectTemplates/SuperSoda/1/',
                                auth_token: 'token')
