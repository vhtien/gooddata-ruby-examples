data = <<JSON_DATA
{
  "param_1" : {
    "deeper_key" : "value_1"
  },
  "param_2" : "value_2"
}
JSON_DATA


# Note that <<JSON_DATA and JSON_DATA marks the beginning and the end of the string. Once we have the JSON string defined we can use JSON libraries to convert it. Here we are using MultiJson which is part fo the Ruby SDK.

params = MultiJson.load(data)
=> {"param_1"=>{"deeper_key"=>"value_1"}, "param_2"=>"value_2"}