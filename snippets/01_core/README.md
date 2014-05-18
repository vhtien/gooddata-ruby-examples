# Core Examples

## connect.rb 

Connect using username and password

### Description

Example how to connect to GoodData platform using username and password

### Running

```
ruby connect.rb
```

### Output

```
tomaskorcak@kx-mac gooddata-ruby-examples (master) $ ruby snippets/01_core/connect.rb
Connecting as svarovsky+gem_tester@gooddata.com
Disconnecting
tomaskorcak@kx-mac gooddata-ruby-examples (master) $
```

## handling_errors.rb 

Handle possible errors

### Description

Example how the possible errors can be catched and handled

### Running

```
ruby handling_errors.rb
```

### Output

```
tomaskorcak@kx-mac gooddata-ruby-examples (master) $ ruby snippets/01_core/handling_errors.rb
Connecting as svarovsky+gem_tester@gooddata.com
ERROR:
401 Unauthorized: {"parameters":[],"component":"Account::Login::AuthShare","message":"Bad Login or Password!"}
Disconnecting
```
