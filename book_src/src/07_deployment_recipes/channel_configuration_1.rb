# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |client|
  client.user.create_channel
end