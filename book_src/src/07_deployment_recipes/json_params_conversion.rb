data = <<JSON_DATA
{
  "a" : {
    "b" : "c"
  }
}
JSON_DATA


# Note that <<JSON_DATA and JSON_DATA marks the beginning and the end of the string. Once we have the JSON string defined we can use JSON libraries to convert it. Here we are using MultiJson which is part fo the Ruby SDK.

params = MultiJson.load(data)
=> {"a"=>{"b"=>"c"}} 