# encoding: utf-8

require 'gooddata'

client = GoodData.connect
project = client.projects('project_pid')
project.member?('jane.doe @example.com ')
