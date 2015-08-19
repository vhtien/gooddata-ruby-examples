require 'gooddata'
require 'pp'

PID = 'rq3enqarynvkt7q11u0stev65qdwpow8'
REPORT = '/gdc/md/rq3enqarynvkt7q11u0stev65qdwpow8/obj/1323'

GoodData.with_connection do |c|
  GoodData.with_project(PID) do |project|
    report = project.reports(REPORT)

    new_def = report.update_definition(:immutable => false) do |rdef|
      rdef.title = "Test TITLE: #{DateTime.now.strftime}"
    end

    pp new_def
  end
end
