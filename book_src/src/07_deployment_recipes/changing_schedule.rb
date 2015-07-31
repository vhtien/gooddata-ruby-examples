# encoding: utf-8

require 'gooddata'

schedule_id = 'fill_in'

GoodData.with_connection do |client|
  project = client.projects('project_id')
  schedule = project.schedules(schedule_id)
  # you can change pretty much anything

  # executable
  s.executable = 'entry_point.rb'

  # params
  s.params
  # {
  #   "PROCESS_ID"=>"c42c1b82-7d6f-433a-b008-9cdb1d454e01",
  #   "EXECUTABLE"=>"new_main.rb",
  #   :a=>:b
  # }
  s.set_param(:a, :c)
  s.params
  # {
  #   "PROCESS_ID"=>"c42c1b82-7d6f-433a-b008-9cdb1d454e01",
  #   "EXECUTABLE"=>"new_main.rb",
  #   :a=>:c
  # }
  s.update_params({
    :a => 42,
    :b => [1,2,3]
  })
  s.params
  # {
  #   "PROCESS_ID"=>"c42c1b82-7d6f-433a-b008-9cdb1d454e01",
  #   "EXECUTABLE"=>"new_main.rb",
  #   :a => 42,
  #   :b=>[1, 2, 3]
  # }
  
  # reschedule
  s.reschedule # => 0
  s.reschedule = 15
  
  # name
  s.name # => "Some Name"
  s.name = "Better Name"

  # enable/disable
  s.state # => "ENABLED"
  s.disable
  s.state # => "DISABLED"
  s.enable
  s.state # => "ENABLED"

  # cron expression
  s.cron # => "1 1 1 * *"
  s.cron = "1 1 1 1 *"

  # "run after" schedule
  after_schedule = project.schedules('some_id')
  s.after = after_schedule

  # Do not foreget to save it
  s.save
end
