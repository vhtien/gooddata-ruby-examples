require 'gooddata'

client = GoodData.connect
project = client.projects('project_id')

# You can set some metadata
p.set_metadata('key', 'value')

# You can access the project metadata in two ways
# 
# First is to get specific key directly
p.metadata('key')
# => 'value
# In case you try to access a nonexisting key you will get 404

# Second is to access all metadata. This will return them as a Hash which you can access as usual
m = p.metadata
# => {"key"=>"value"}
m['key']
# => "value"

