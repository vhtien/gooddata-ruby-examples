[source,ruby]
----
# encoding: utf-8

require 'gooddata'

client = GoodData.connect
project = client.projects('project_id')
process = project.processes.first
process.deploy('path_to_your_process')
----