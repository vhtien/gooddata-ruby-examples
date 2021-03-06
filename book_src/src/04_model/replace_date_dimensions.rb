# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |c|
  GoodData.with_project('project_pid') do |project|

    opts = {
      # You can specify name of new and old date dimension...
      # :old => 'Close',
      # :new => 'Completed',

      # Or explicitly specify mapping using identifiers...
      :mapping => {
        'closedate.date' => 'abortdate.date',
        'closedate.day.in.euweek' => 'abortdate.day.in.week',
        'closedate.month' => 'abortdate.month',
        'closedate.month.in.year' => 'abortdate.month.in.year',
        'closedate.euweek.in.year' => 'abortdate.week.in.year',
        'closedate.euweek' => 'abortdate.week',
        'closedate.quarter' => 'abortdate.quarter',
        'closedate.day.in.month' => 'abortdate.day.in.month',
        'closedate.week.in.quarter' => 'abortdate.week.in.quarter',
        'closedate.quarter.in.year' => 'abortdate.quarter.in.year',
        'closedate.week' => 'abortdate.week',
        'closedate.day.in.year' => 'abortdate.day.in.year',
        'closedate.day.in.week' => 'abortdate.day.in.week',
        'closedate.week.in.year' => 'abortdate.week.in.year',
        'closedate.euweek.in.quarter' => 'abortdate.week.in.quarter',
        'closedate.day.in.quarter' => 'abortdate.day.in.quarter',
        'closedate.year' => 'closedate.year',
        'closedate.month.in.quarter' => 'abortdate.month.in.quarter'
      },

      :dry_run = false # Optional. Default 'false'
    }

    project.replace_from_mapping(opts)
  end
end
