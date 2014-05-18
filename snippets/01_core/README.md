# Core Examples

## connect.rb - connect using username and password

Example how to connect to GoodData platform using username and password

## handling_errors.rb - handle possible errors

Example how the possible errors can be catched and handled

### Running

```
ruby handling_errors.rb
```

### Output

tomaskorcak@kx-mac gooddata-ruby-examples (master) $ ruby snippets/01_core/handling_errors.rb
Connecting as svarovsky+gem_tester@gooddata.com
ERROR
401 Unauthorized: {"parameters":[],"component":"Account::Login::AuthShare","message":"Bad Login or Password!"}
Disconnecting