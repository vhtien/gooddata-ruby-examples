# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |client|
  client.user.channels.each do |channel|
    channel.to = 'another email'
    channel.save
    channel.delete
  end
end