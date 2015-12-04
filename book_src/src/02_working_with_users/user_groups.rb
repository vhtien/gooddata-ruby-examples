# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |client|
  client.with_project('project') do |p|
    group_1 = p.add_user_group(name: 'east')
    group_1.add_members(p.member('john.doe@gooddata.com'))
    pp group_1.members.map(&:uri)
    # ['/gdc/account/profile/4e1e8cacc4989228e0ae531b30853248']

    group_1.member?('/gdc/account/profile/4e1e8cacc4989228e0ae531b30853248')
    # => true
  end
end
