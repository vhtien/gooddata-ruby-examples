require 'gooddata'

client = GoodData.connect
project = client.projects('project_id')
bp = project.blueprint

File.open('model.json', 'w') do |f|
  f << JSON.pretty_generate(bp.to_hash)
end