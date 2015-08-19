require 'gooddata'

client.get("/gdc/md/")

project_id = 'YOUR_PROJECT_ID'

client.delete("/gdc/projects/#{project_id}")