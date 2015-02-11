# encoding: utf-8

require 'gooddata'

client = GoodData.connect
GoodData.with_connection do |client|
  schedules = client.projects.pselect(&:am_i_admin?).pmapcat(&:schedules)
  schedules.pmap do |schedule|
    schedule.disable
    schedule.save
  end
end
