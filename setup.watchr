watch( '(.*)\.asciidoc' )  {|match_data_object| system "ruby script/build.rb"}

