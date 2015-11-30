# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |client|
  client.with_project('project') do |p|
    group_1 = p.add_group(name: 'east')
    group_1.add_memebers(project.member('john.doe@gooddata.com'))

    group_2 = p.add_group(name: 'us')
    pp group_2.members.map(&:uri)
    group_2.member?('john.doe@gooddata.com')
    # => true
  end
end
